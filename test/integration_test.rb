gem 'minitest', '~> 5.2'                 # => true
require 'minitest/autorun'               # => true
require 'minitest/pride'                 # => true
require_relative '../lib/event_manager'  # => true

class IntegrationTest < Minitest::Test
  def test_it_lookup_by_last_name
    list_of_attendees = []                                                                # => []
    event_manager = EventManager.new(list_of_attendees)                                   # => #<EventManager:0x007fc811233b20 @reporters=[]>
    entries = event_manager.look_up('Parker').sort_by { |name| name.first_name }  # => []

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

# 3949,1/31/09 23:00,Gregory,Parker,jhopenh1@jumpstartlab.com,718-305-4000,"7123 Penn Avenue, #3",Pittsburgh,PA,15208
# 4236,2/1/09 17:05,Patrick,Parker,qkika_farrell@jumpstartlab.com,718-305-4000,4509 Frankford Avenue,Philadelphia,PA,19214
# 4551,2/1/09 20:53,Scott,Parker,qhuer321@jumpstartlab.com,202-270-1000,19308 Alderbarn Ct,Brookeville,MD,20833

# >> Run options: --seed 2851
# >>
# >> # Running:
# >>
# >> [41m[37mF[0m
# >>
# >> [38;5;154mF[0m[38;5;154ma[0m[38;5;148mb[0m[38;5;184mu[0m[38;5;184ml[0m[38;5;214mo[0m[38;5;214mu[0m[38;5;208ms[0m[38;5;208m [0m[38;5;203mr[0m[38;5;203mu[0m[38;5;198mn[0m in 0.001111s, 900.0900 runs/s, 900.0900 assertions/s.
# >>
# >>   1) Failure:
# >> IntegrationTest#test_it_lookup_by_last_name [/Users/richshea/Turing/event_reporter/test/integration_test.rb:12]:
# >> Expected: 3
# >>   Actual: 0
# >>
# >> 1 runs, 1 assertions, 1 failures, 0 errors, 0 skips
