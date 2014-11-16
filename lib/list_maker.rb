class ListMaker
  attr_reader :list_of_attendees, :organized_list_of_attendees

  def initialize(list_of_attendees)
    @organized_list_of_attendees ||= list_of_attendees.map { |list_of_attendees| Attendees.new(list_of_attendees) }
  end

  def process_last_name(name)
    query_list = organized_list_of_attendees.select { |attendee| attendee.last_name == name }
    query_list.sort_by { |attendee| attendee.first_name }
  end
end
