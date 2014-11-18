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
    # @date       = data[:regdate]
    @last_name    = data[:last_name]
    @first_name   = data[:first_name]
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

  def home_phone
    @home_phone.to_s.chars.select { |s| s =~ /[0-9]/}.join
  end

  def zipcode
    @zipcode.to_s.rjust(5, '0')
  end


end
