class Printer

  def intro_message
    "Welcome to Event Reporter!\nType 'help' at any time for a list of commands"
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
    "Event Reporter comes with a list of of helpful commands.\nType 'help' followed by the command to learn more about each command. Ex. help queue count\n\n\tquit\n\tload\n\tfind\n\tqueue count\n\tqueue clear\n\tqueue print\n\tqueue save\n\tsearch options"
  end

  def help_quit
    "\nYou may type 'quit' at any time to exit Event Reporter"
  end

  def help_load
    "\nTo load a file please enter 'load' followed by the <filename>\nEx. load new_file.csv\nIf you type 'load' without indicating a specific file the event_attendees.csv will be loaded by default."
  end

  def help_find
    "\nAfter a file has been loaded you can search the contents of the file by indicating your search criteria.\nEx. find last_name smith (This search will return all attendees with a last name of 'smith')\nFor a list of search criteria options please type 'help search options'"
  end

  def help_queue_count
    "\nType 'queue count' to display the total number of attendees that meet your search criteria"
  end

  def help_queue_clear
    "\nType 'queue clear' to clear the stored results of your most recent search"
  end

  def help_queue_print
    "\nThere are two print options to choose from:\n\t'queue print' will print the results of your search in the order that they are found in the file.\n\t'queue print by <criteria>' will sort your results by the indicated <criteria> and then print them.\n\t\tEx. 'queue print by last_name' will sort your search by last name and then print the results"
  end

  def help_queue_save
    "\nTo save a search in a new file please type 'queue save to <filename>.csv'.\nEx. queue save to recent_search.csv"
  end

  def search_options
    "\nList of search criteria options:\nlast_name\nfirst_name\nhome_phone\nemail\nstreet\ncity\nstate\nzipcode"
  end
end
