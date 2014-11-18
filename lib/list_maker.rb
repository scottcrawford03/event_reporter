require_relative 'attendee'
require 'pry'

class ListMaker
  attr_reader :list_of_attendees, :organized_list_of_attendees

  def initialize(list_of_attendees)
    @organized_list_of_attendees ||= list_of_attendees.map { |row| Attendee.new(row) }
  end

  def process_attribute(criteria, attribute)
    binding.pry
    organized_list_of_attendees.select { |attendee| attendee.send(criteria) == attribute }.sort_by { |attendee| attendee.last_name }
  end

end
