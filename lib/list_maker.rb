require_relative 'attendee'

class ListMaker
  attr_reader :list_of_attendees, :organized_list_of_attendees

  def initialize(list_of_attendees)
    @organized_list_of_attendees ||= list_of_attendees.map { |row| Attendee.new(row) }
  end

  def process_attribute(criteria, attribute)
    organized_list_of_attendees.select { |attendee| attendee.send(criteria) == attribute }
  end

end
