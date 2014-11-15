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

    assert_equal "Gregory Parker", e1.name
    assert_equal "718-305-4000", e1.phone_number

    assert_equal "Patrick Parker", e2.name
    assert_equal "718-305-4000", e2.phone_number

    assert_equal "Scott Parker", e3.name
    assert_equal "202-270-1000", e3.phone_number
  end
end

# 3949,1/31/09 23:00,Gregory,Parker,jhopenh1@jumpstartlab.com,718-305-4000,"7123 Penn Avenue, #3",Pittsburgh,PA,15208
# 4236,2/1/09 17:05,Patrick,Parker,qkika_farrell@jumpstartlab.com,718-305-4000,4509 Frankford Avenue,Philadelphia,PA,19214
# 4551,2/1/09 20:53,Scott,Parker,qhuer321@jumpstartlab.com,202-270-1000,19308 Alderbarn Ct,Brookeville,MD,20833
