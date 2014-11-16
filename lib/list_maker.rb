require_relative 'attendees'
class ListMaker
  attr_reader :list_of_attendees, :organized_list_of_attendees

  def initialize(list_of_attendees)
    @organized_list_of_attendees ||= list_of_attendees.map { |list_of_attendees| Attendees.new(list_of_attendees) }
  end

  def process_last_name(name)
    organized_list_of_attendees.select { |attendee| attendee.last_name == name }.sort_by { |attendee| attendee.first_name }
  end

  def process_home_phone(phone)
    organized_list_of_attendees.select { |attendee| attendee.home_phone == phone }.sort_by { |attendee| attendee.last_name }
  end

  def process_first_name(name)
    organized_list_of_attendees.select { |attendee| attendee.first_name == name }.sort_by { |attendee| attendee.last_name }
  end

  def process_email(email)
    organized_list_of_attendees.select { |attendee| attendee.email == email }.sort_by { |attendee| attendee.last_name }
  end

end
