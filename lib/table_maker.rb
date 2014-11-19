require 'terminal-table'

class TableMaker
  attr_reader :table,
              :rows

  def initialize
    @rows = []
    @table = create_table
  end


  def create_table
  Terminal::Table.new headings: ['Last Name', 'First Name', 'Email', 'Home Phone', 'City', 'State', 'Zipcode'],
                      rows: rows
  end

  def update(attendee_traits)
      attendee_traits.each_index { |index| rows << attendee_traits[index] }
  end

  def show
    table
  end

end
