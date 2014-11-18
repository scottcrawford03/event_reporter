gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/printer'

class IntegrationTest < Minitest::Test
  def test_it_lookup_by_last_name
    entries = [
      { regdate: '1/31/09 23:00', first_name: 'Gregory', last_name: 'Parker', email_address: 'jhopenh1@jumpstartlab.com', homephone: '718-305-4000', street: '7123 Penn Avenue, #3', city: 'Pittsburgh', state: 'PA', zipcode: '15208' },
      { regdate: '2/1/09 17:05', first_name: 'Patrick', last_name: 'Parker', email_address: 'qkika_farrell@jumpstartlab.com', homephone: '718-305-4000', street: '4509 Frankford Avenue', city: 'Philadelphia', state: 'PA', zipcode: '19214' },
      { regdate: '2/1/09 20:53', first_name: 'Scott', last_name: 'Parker', email_address: 'qhuer321@jumpstartlab.com', homephone: '202-270-1000', street: '19308 Alderbarn Ct', city: 'Brookeville', state: 'MD', zipcode: '20833'}
    ]

    list_maker = ListMaker.new(entries)
    entries = list_maker.process_attribute('last_name','parker')

    assert_equal 3, entries.size
    e1, e2, e3 = entries

    assert_equal "gregory parker", e1.name
    assert_equal "7183054000", e1.home_phone

    assert_equal "patrick parker", e2.name
    assert_equal "7183054000", e2.home_phone

    assert_equal "scott parker", e3.name
    assert_equal "2022701000", e3.home_phone
  end
end
