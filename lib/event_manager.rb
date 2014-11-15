require_relative 'reporters'  # => true

class EventManager
  attr_reader :reporters  # => nil

  def initialize(entries)
    @reporters = entries.map { |data| Reporters.new(data) }
  end

  def look_up(name)
    []
  end

  def look_up_by_last_name(name)
    new_list = reporters.select { |reporter| reporter.last_name == name}
    new_list.sort_by { |entry| entry.first_name }
  end


end
