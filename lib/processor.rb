require_relative 'printer'
require_relative 'load_file'
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
    @instruction, @criteria, @attribute = account_for_to_or_by(command.split)
    case instruction
    when 'load'  then loader(criteria)
    when 'find'  then find(criteria, attribute)
    when 'queue' then queue_commands(criteria)
    when 'help'
    when 'quit'
    else output.puts printer.invalid_input
    end
  end

  def account_for_to_or_by(command)
    command.delete_at(2) if command[2] == 'to' || command[2] == 'by'
    command
  end

  def queue_commands(criteria)
    case criteria
    when 'print' then queue_print
    when 'clear' then new_queue.clear
    when 'count'  then output.puts new_queue.count
    when ''
    end

  end

  def queue_print
    printer.queue_printer(new_queue)
  end

  def loader(csv_file)
    if File.exist?("#{csv_file}")
      list_of_attendees = LoadFile.load_csv(csv_file)
      output.puts printer.loaded_success
    elsif
      list_of_attendees = LoadFile.load_csv('event_attendees.csv')
      output.puts printer.loaded_success
    end
    @list_maker  = ListMaker.new(list_of_attendees)
  end

  def find(criteria, attribute)
    if criteria == 'home_phone' || criteria == 'zipcode'
    result = list_maker.process_attribute(criteria, cleaner(criteria, attribute))
    else
    result = list_maker.process_attribute(criteria, attribute)
    end
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

end
