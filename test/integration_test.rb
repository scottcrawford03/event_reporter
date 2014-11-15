gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/command_center'

class IntegrationTest < Minitest::Test
  def test_it_lookup_by_last_name
    command_center = CommandCenter.new
    entries = command_center.look_up('Parker').sort_by { |name| name.first_name }

    assert_equal 3, entries.size
    e1, e2, e3 = entries

    assert_equal "Agnes Parker", e1.name
    assert_equal "758.942.6890", e1.phone_number

    assert_equal "Craig Parker", e2.name
    assert_equal "716-133-3210", e2.phone_number

    assert_equal "Mohamed Parker", e3.name
    assert_equal "701-655-6889", e3.phone_number
  end
end
