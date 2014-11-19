require_relative 'cleaner'
class Attendee
  attr_reader :first_name,
              :last_name,
              :email,
              :home_phone,
              :street,
              :city,
              :state,
              :zipcode

  def initialize(data)
    @last_name    = Cleaner.new.clean(data[:last_name])
    @first_name   = Cleaner.new.clean(data[:first_name])
    @email        = Cleaner.new.clean(data[:email_address])
    @home_phone   = Cleaner.new.clean_phone_number(data[:homephone])
    @street       = Cleaner.new.clean(data[:street])
    @city         = Cleaner.new.clean(data[:city])
    @state        = Cleaner.new.clean(data[:state])
    @zipcode      = Cleaner.new.clean_zip_code(data[:zipcode])
  end

  def name
    "#{@first_name} #{@last_name}"
  end
end
