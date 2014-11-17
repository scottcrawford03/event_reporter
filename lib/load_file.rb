require 'csv'
require_relative '../event_attendees.csv'  # => true

class LoadFile
  attr_reader :file, :list_of_attendees  # => nil

  def initialize(file = 'event_attendees.csv')
    @file = file
    @list_of_attendees = list_of_attendees
  end

  def file_converter
    file_data = CSV.read(file, header: true, header_converters: :symbol)
    @list_of_attendees = file_data.map do |row|
      row.to_hash
    end
  end

end
