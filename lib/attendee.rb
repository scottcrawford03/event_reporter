class Attendee
  attr_reader :date,
              :first_name,
              :last_name,
              :email,
              :home_phone,
              :street,
              :city,
              :state,
              :zipcode

  def initialize(data)
    @date         = data[:regdate]
    @first_name   = data[:first_name]
    @last_name    = data[:last_name]
    @email        = data[:email_address]
    @home_phone   = data[:homephone]
    @street       = data[:street]
    @city         = data[:city]
    @state        = data[:state]
    @zipcode      = data[:zipcode]
  end

  def name
    "#{@first_name} #{@last_name}"
  end
end
