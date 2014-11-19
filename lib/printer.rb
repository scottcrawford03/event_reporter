class Printer

  def intro_message
    'Welcome to Event Reporter!'
  end

  def invalid_input
    'Your input is invalid. Please try again.'
  end

  def loaded_success
    "Your file has been loaded successfully!"
  end

  def save_header
  'last_Name,first_Name,Email_Address,HomePhone,Street,City,State,Zipcode'
  end

  def print_header
    "Last Name     First Name          Email                            Home Phone     Street                   City     State     Zipcode"
  end

  def queue_printer(current_queue)
    # max_length = current_queue.max_by { |attendee| attendee.last_name.length }
    puts print_header
    current_queue.each do |attendee|
      attendee.instance_variables.each { |ivar| print "#{attendee.instance_variable_get(ivar)}\t" }
    puts "\n"
    end
  end

  def after_search
    "Your search is done. Check the queue."
  end

  def queue_size(latest_queue)
    "Your Queue has #{latest_queue} item(s) in it."
  end

  def event_attendees_loaded
    "The default file Event_Attendees.csv was loaded successfully!"
  end
end
