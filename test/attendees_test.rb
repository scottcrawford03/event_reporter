gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/attendee'

class AttendeeTest < Minitest::Test
  def test_attendees_attributes
    data = {
      regdate:       '1/31/09',
      first_name:    'Gregory',
      last_name:     'Parker',
      email_address: 'jhopenh1@jumpstartlab.com',
      homephone:     '718-305-4000',
      street:        '7123 Penn Avenue, #3',
      city:          'Pittsburgh',
      state:         'PA',
      zipcode:       '15208'
    }
    entry = Attendee.new(data)

    assert_equal '1/31/09', entry.date
    assert_equal 'Gregory', entry.first_name
    assert_equal 'Parker', entry.last_name
    assert_equal 'Gregory Parker', entry.name
    assert_equal '718-305-4000', entry.home_phone
    assert_equal 'jhopenh1@jumpstartlab.com', entry.email
    assert_equal '7123 Penn Avenue, #3', entry.street
    assert_equal 'Pittsburgh', entry.city
    assert_equal 'PA', entry.state
    assert_equal '15208', entry.zipcode

  end
end

# 3949,1/31/09 23:00,Gregory,Parker,jhopenh1@jumpstartlab.com,718-305-4000,"7123 Penn Avenue, #3",Pittsburgh,PA,15208
