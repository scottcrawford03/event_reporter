require_relative 'attendees'
require_relative 'list_maker'

class EventManager
  attr_reader :list_of_attendees

  def initialize(entries)
    @list_of_attendees = ListMaker.new(entries)
  end

  def find(entry)
    []
  end


end
