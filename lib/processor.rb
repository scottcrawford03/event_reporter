class Processor
  attr_reader :command,
              :instruction,
              :criteria,
              :attribute,
              :list_maker

  def initialize
    @command     = command
    @instruction = instruction
    @criteria    = criteria
    @attribute   = attribute
    # @messages    = Messages.new
    # @list_maker  = ListMaker.new()
  end


  def process(command)
  @instruction, @criteria, @attribute = command.split (' ')

#   case
#   when instruction == 'find'  then find(criteria, attribute)
#   when instruction == 'load'  then
#   when instruction == 'queue'
#   when instruction == 'help'
#   when instruction == 'quit'
#   # else messages.invalid_input
#   end
  end
#
#   # def find(criteria, attribute)
#   #   case
#   #   when criteria == 'first_name' then list_maker.process_first_name(attribute)
#   #   when criteria == 'last_name'  then list_maker.process_last_name(attribute)
#   #   when criteria == 'home_phone' then list_maker.process_home_phone(attribute)
#   #   when criteria == 'email'      then list_maker.process_email(attribute)
#   #   when criteria == 'street'     then list_maker.process_street(attribute)
#   #   when criteria == 'city'       then list_maker.process_city(attribute)
#   #   when criteria == 'state'      then list_maker.process_state(attribute)
#   #   when criteria == 'zipcode'    then list_maker.process_zipcode(attribute)
#     # else messages.invalid_input
#   #   end
#   # end
end
