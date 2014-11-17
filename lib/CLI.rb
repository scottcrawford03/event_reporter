require_relative '../lib/messages'
require_relative '../lib/event_manager'
require_relative '../lib/processor'

class CLI
  attr_reader :input,
              :output,
              :messages,
              :command,
              :processor

  def initialize(input, output)
    @input     = input
    @output    = output
    @command   = ''
    @messages  = Messages.new
    @processor = Processor.new(input, output)

  end

  def search
    output.puts messages.intro_message
    until quit?
      @command = input.gets.chomp.downcase
      process_commands(command)
    end
  end

  def quit?
    command == "q" || command == "quit"
  end

  def process_commands(command)
    processor.process(command)
  end

end
