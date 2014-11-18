require_relative 'messages'
require_relative 'load_file'
require_relative 'list_maker'

class Processor
  attr_reader :command,
              :instruction,
              :criteria,
              :attribute,
              :list_maker,
              :messages,
              :output,
              :input,
              :list_maker

  def initialize(input, output)
    @output      = output
    @input       = input
    @command     = nil
    @instruction = instruction
    @criteria    = criteria
    @attribute   = attribute
    @messages    = Messages.new
    @list_maker  = list_maker
  end

  def process(command)
    @instruction, @criteria, @attribute = account_for_to_or_by(command.split)
    case instruction
    when 'load'  then loader(criteria)
    when 'find'  then find(criteria, attribute)
    when 'queue'
    when 'help'
    when 'quit'
    else output.puts messages.invalid_input
    end
  end

  def account_for_to_or_by(command)
    command.delete_at(2) if command[2] == 'to' || command[2] == 'by'
    command
  end


  def loader(csv_file = 'event_attendees.csv')
    if csv_file
      list_of_attendees = LoadFile.load_csv(csv_file)
    else
      list_of_attendees = LoadFile.load_csv('event_attendees.csv')
      output.puts messages.loaded_success
    end
    @list_maker  = ListMaker.new(list_of_attendees)
  end

  def find(criteria, attribute)
    result = list_maker.process_attribute(criteria, attribute)
  end
end
