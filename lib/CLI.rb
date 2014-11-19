require_relative '../lib/printer'
require_relative '../lib/processor'

class CLI
  attr_reader :input,
              :output,
              :printer,
              :command,
              :processor

  def initialize(input, output)
    @input             = input
    @output            = output
    @command           = ''
    @printer           = Printer.new
    @processor         = Processor.new(input, output)
  end

  def search
    output.puts printer.intro_message
    until quit?
      output.print printer.entry_prompt
      @command = input.gets.chomp.downcase
      processor.process_commands(command)
    end
  end


  def quit?
    command == "q" || command == "quit"
  end

end
