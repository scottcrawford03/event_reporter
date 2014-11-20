require_relative '../test_helper'
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

    assert_equal 'gregory', entry.first_name
    assert_equal 'parker', entry.last_name
    assert_equal 'gregory parker', entry.name
    assert_equal '718-305-4000', entry.home_phone
    assert_equal 'jhopenh1@jumpstartlab.com', entry.email
    assert_equal '7123 penn avenue, #3', entry.street
    assert_equal 'pittsburgh', entry.city
    assert_equal 'pa', entry.state
    assert_equal '15208', entry.zipcode

  end
end

# 3949,1/31/09 23:00,Gregory,Parker,jhopenh1@jumpstartlab.com,718-305-4000,"7123 Penn Avenue, #3",Pittsburgh,PA,15208
