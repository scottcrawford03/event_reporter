class Reporters
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
    @date         = data[:RegDate]
    @first_name   = data[:first_Name]
    @last_name    = data[:last_Name]
    @email        = data[:Email_Address]
    @home_phone   = data[:HomePhone]
    @street       = data[:Street]
    @city         = data[:City]
    @state        = data[:State]
    @zipcode      = data[:Zipcode]
  end

  def name
    "#{@first_name} #{@last_name}"
  end

end
