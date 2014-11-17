gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/event_manager'
require_relative '../event_attendees_small'

class IntegrationTest < Minitest::Test
  def test_it_lookup_by_last_name
    event_manager = EventManager.new(list_of_attendees)
    entries = event_manager.find('Parker')

    assert_equal 3, entries.size
    e1, e2, e3 = entries

    assert_equal "Gregory Parker", e1.name
    assert_equal "718-305-4000", e1.home_phone

    assert_equal "Patrick Parker", e2.name
    assert_equal "718-305-4000", e2.home_phone

    assert_equal "Scott Parker", e3.name
    assert_equal "202-270-1000", e3.home_phone
  end
end
