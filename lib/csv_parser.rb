require 'CSV'

class CSVParser
  def self.load_csv(file_name)
    file_name = File.join 'csv', file_name
    csv = CSV.table(file_name, header_converters: :symbol, converters: :all)
  end

  def self.save_csv(file_name, attendee_traits)
    file_name = File.join 'csv', file_name
    CSV.open(file_name, 'wb') do |csv|
      csv << %w(last_Name first_Name Email_Address HomePhone Street City State Zipcode)
      attendee_traits.each_index { |index| csv << attendee_traits[index] }
    end
  end
end
