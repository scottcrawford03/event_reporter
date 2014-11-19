require_relative 'printer'
require_relative 'csv_parser'
require_relative 'list_maker'

class Processor
  attr_reader :command,
              :instruction,
              :criteria,
              :attribute,
              :list_maker,
              :printer,
              :output,
              :input,
              :list_maker,
              :new_queue,
              :result

  def initialize(input, output)
    @printer     = Printer.new
    @new_queue   = []
    @output      = output
    @input       = input
    @command     = nil
    @instruction = instruction
    @criteria    = criteria
    @attribute   = attribute
    @list_maker  = list_maker
    @result      = result
  end

  def process(command)
    @instruction, @criteria, *@attribute = account_for_to_or_by(command.split)
    case instruction
    when 'load'  then loader(criteria)
    when 'find'  then find(criteria, attribute)
    when 'queue' then queue_commands(criteria, attribute)
    when 'help'
    when 'quit'
    else output.puts printer.invalid_input
    end
  end

  def account_for_to_or_by(command)
    command.delete_at(2) if command[2] == 'to' || command[2] == 'by'
    command
  end

  def queue_commands(criteria, attribute = nil)
    case criteria
    when 'print' then queue_print(attribute.join(' '))
    when 'clear' then new_queue.clear
    when 'count' then output.puts queue_counter
    when 'save'  then write_to_csv(attribute[0])
    when 'help'  then queue_help
    end

  end

  def queue_print(attribute = nil)
    if attribute.empty?
    printer.queue_printer(new_queue)
    else
    sort = new_queue.sort_by! { |attendee| attendee.send(attribute) }
    printer.queue_printer(sort)
    end
  end

  def queue_counter
    output.puts printer.queue_size(new_queue.count)
  end

  def loader(csv_file )
    if csv_file
      list_of_attendees = CSVParser.load_csv(csv_file)
      output.puts printer.loaded_success
    else
      list_of_attendees = CSVParser.load_csv('event_attendees.csv')
      output.puts printer.event_attendees_loaded
    end
    @list_maker  = ListMaker.new(list_of_attendees)
  end

  def write_to_csv(csv_file)
    CSVParser.save_csv(csv_file, attendee_traits)
  end


  def find(criteria, attribute)
    if criteria == 'home_phone' || criteria == 'zipcode'
    result = list_maker.process_attribute(criteria, cleaner(criteria, attribute))
    else
    result = list_maker.process_attribute(criteria, attribute.join(' '))
    end
    output.puts printer.after_search
    @new_queue = result
  end

  def cleaner(criteria, attribute)
    case criteria
    when 'home_phone' then attribute.to_s.chars.select { |s| s =~ /[0-9]/}.join
    when 'zipcode'    then zipcode_cleaner(attribute)
    end

  end

  def zipcode_cleaner(zip)
    zip.to_s.rjust(5,'0')
  end

  def attendee_traits
    new_queue.map do |attendee|
      attendee.instance_variables.map { |ivar| attendee.instance_variable_get(ivar)}
    end
  end

end
