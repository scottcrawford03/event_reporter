require_relative 'attendees'  # => true

class EventManager
  attr_reader :list_of_attendees  # => nil

  def initialize(entries)
    @list_of_attendees = entries.map { |attendee| Attendees.new(attendee) }
  end

  def look_up(name)
    []
  end

  def look_up_by_last_name(name)
    new_list = list_of_attendees.select { |attendee| attendee.last_name == name}
    new_list.sort_by { |attendee| attendee.first_name }
  end


end
