require 'terminal-table'

class TableMaker
  attr_reader :table,
              :rows

  def initialize
    @rows = []
    @table = create_table
  end


  def create_table
  Terminal::Table.new headings: ['Last Name', 'First Name', 'Email', 'Home Phone', 'Street', 'City', 'State', 'Zipcode'],
                      rows: rows
  end

  def update(new_queue)
      new_queue.each { |attendee| rows << ["#{attendee.last_name.capitalize}",
                                           "#{attendee.first_name.capitalize}",
                                           "#{attendee.email}",
                                           "#{attendee.home_phone}",
                                           "#{attendee.street}",
                                           "#{attendee.city.capitalize}",
                                           "#{attendee.state.upcase}",
                                           "#{attendee.zipcode}"             ] }
    @table = create_table

  end

  def show
    table
  end

end
