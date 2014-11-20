require_relative 'printer'
require_relative 'csv_parser'
require_relative 'list_maker'
require_relative 'table_maker'

class Processor
  attr_reader :command,
              :instruction,
              :criteria,
              :attribute,
              :printer,
              :output,
              :input,
              :list_maker,
              :new_queue,
              :result,
              :list_of_attendees

  def initialize(input, output)
    @printer           = Printer.new
    @new_queue         = []
    @output            = output
    @input             = input
    @command           = command
    @instruction       = instruction
    @criteria          = criteria
    @attribute         = attribute
    @list_maker        = list_maker
    @result            = result
    @list_of_attendees = []
  end

  def process_commands(command)
    @instruction, @criteria, *@attribute = account_for_to_or_by(command.split)
    process_instruction(criteria, attribute)
  end

  def process_instruction(criteria, attribute)
    case instruction
    when 'load'     then loader(criteria)
    when 'find'     then find(criteria, attribute)
    when 'queue'    then queue_commands(criteria, attribute)
    when 'help'     then help_commands(criteria, attribute)
    when 'quit'     then output.puts printer.quit_message
    else output.puts printer.invalid_input
    end
  end

  def account_for_to_or_by(command)
    command.delete('to') || command.delete('by')
    command
  end

  def help_commands(criteria = nil, attribute = nil)
    case criteria
    when nil       then output.puts printer.help_commands
    when 'quit'    then puts printer.help_quit
    when 'load'    then puts printer.help_load
    when 'find'    then puts printer.help_find
    when 'queue'   then help_queue_commands(attribute)
    when 'search'  then puts printer.search_options
    end
  end

  def help_queue_commands(attribute)
    case attribute
    when ['count'] then puts printer.help_queue_count
    when ['clear'] then puts printer.help_queue_clear
    when ['print'] then puts printer.help_queue_print
    when ['save']  then puts printer.help_queue_save
    end
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

  def queue_print(attribute)
    system "clear"
    case
    when attribute.empty? then empty_table
    else sorted_queue_print(attribute)
    end
  end

  def empty_table
    empty_table = TableMaker.new
    empty_table.update(new_queue)
    output.puts empty_table.show
  end

  def sorted_queue_print(attribute)
    sort = new_queue.sort_by! { |attendee| attendee.send(attribute) }
    sorted_table = TableMaker.new
    sorted_table.update(sort)
    output.puts sorted_table.show
  end

  def queue_counter
    output.puts printer.queue_size(new_queue.count)
  end

  def loader(csv_file)
    case
    when csv_exists(csv_file) then load_user_file(csv_file)
    else load_default_file
    end
    @list_maker  = ListMaker.new(list_of_attendees)
  end

  def load_default_file
    @list_of_attendees = CSVParser.load_csv('event_attendees.csv')
    output.puts printer.event_attendees_loaded
  end

  def load_user_file(csv_file)
    @list_of_attendees = CSVParser.load_csv(csv_file)
    output.puts printer.loaded_success
  end

  def csv_exists(csv_file)
    !csv_file.nil? && File.exist?("csv/#{csv_file}")
  end

  def write_to_csv(csv_file)
    CSVParser.save_csv(csv_file, attendee_traits)
  end

  def find(criteria, attribute)
    case
    when list_of_attendees.empty? then output.puts printer.load_file_first
    when home_and_zip(criteria)
      result = list_maker.process_attribute(criteria, cleaner(criteria, attribute))
      output.puts printer.after_search
    else
      result = list_maker.process_attribute(criteria, attribute.join(' '))
      output.puts printer.after_search
    end
    @new_queue = result if result
  end

  def home_and_zip(criteria)
    criteria == 'home_phone' || criteria == 'zipcode'
  end

  def cleaner(criteria, attribute)
    case criteria
    when 'home_phone' then Cleaner.new.clean_phone_number(attribute)
    when 'zipcode'    then Cleaner.new.clean_zip_code(attribute)
    end
  end

  def attendee_traits
    new_queue.map do |attendee|
      attendee.instance_variables.map { |ivar| attendee.instance_variable_get(ivar) }
    end
  end
end
