gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/event_manager'

class EventManagerTest < Minitest::Test
  def test_it_lookup_by_last_name
    entries = [
      { first_Name: 'Gregory', last_Name: 'Parker', HomePhone: '718-305-4000' },
      { first_Name: 'Patrick', last_Name: 'Parker', HomePhone: '718-305-4000' },
      { first_Name: 'Cindy', last_Name: 'Johnson', HomePhone: '333.333.3333' }
    ]

    event_manager = EventManager.new(entries)
    result = event_manager.look_up_by_last_name("Parker")

    assert_equal 2, result.count

    greg, pat = result

    assert_equal "Gregory", greg.first_name
    assert_equal "Patrick", pat.first_name
  end
end
