class Printer

  def intro_message
    "Welcome to Event Reporter!\nType 'help' for a list of commands"
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
    "Your search was a success!"
  end

  def queue_size(latest_queue)
    "Your Queue has #{latest_queue} item(s) in it."
  end

  def event_attendees_loaded
    "The default file Event_Attendees.csv was loaded successfully!"
  end

  def help_commands
    "Event Reporter comes with a list of of helpful commands.\nType 'help' followed by the command to learn more. Ex. help queue count\n\n\tquit\n\tload\n\tfind\n\tqueue count\n\tqueue clear\n\tqueue print\n\tqueue save"
  end
end
