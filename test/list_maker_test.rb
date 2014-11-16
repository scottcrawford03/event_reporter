gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/list_maker'
require 'pry'

class ListMakerTest < Minitest::Test
  def test_it_lookup_by_last_name
    entries = [
      { first_Name: 'Gregory', last_Name: 'Parker', HomePhone: '718-305-4000' },
      { first_Name: 'Patrick', last_Name: 'Parker', HomePhone: '718-305-4000' },
      { first_Name: 'Cindy', last_Name: 'Johnson', HomePhone: '333.333.3333' }
    ]

    list_maker = ListMaker.new(entries)
    result = list_maker.process_last_name("Parker")

    assert_equal 2, result.count

    greg, pat = result

    assert_equal "Gregory", greg.first_name
    assert_equal "Patrick", pat.first_name
  end

  def test_it_can_look_up_by_phone_number
    entries = [
      { first_Name: 'Gregory', last_Name: 'Parker', HomePhone: '718-305-4000' },
      { first_Name: 'Patrick', last_Name: 'Smith', HomePhone: '718-305-4000' },
      { first_Name: 'Cindy', last_Name: 'Johnson', HomePhone: '333.333.3333' }
    ]

    list_maker = ListMaker.new(entries)
    result = list_maker.process_home_phone('718-305-4000')

    assert_equal 2, result.count

    greg, pat = result

    assert_equal "Gregory", greg.first_name
    assert_equal "Patrick", pat.first_name
  end

  def test_it_can_look_up_by_first_name
    entries = [
      { first_Name: 'Gregory', last_Name: 'Parker', HomePhone: '718-305-4000' },
      { first_Name: 'Patrick', last_Name: 'Smith', HomePhone: '718-305-4000' },
      { first_Name: 'Cindy', last_Name: 'Johnson', HomePhone: '333.333.3333' }
    ]

    list_maker = ListMaker.new(entries)
    result = list_maker.process_first_name('Patrick')

    assert_equal 1, result.count

    pat = result[0]

    assert_equal 'Smith', pat.last_name
  end

  def test_it_can_look_up_by_email
    entries = [
      { RegDate: '1/31/09 23:00', first_Name: 'Gregory', last_Name: 'Parker', Email_Address: 'jhopenh1@jumpstartlab.com', HomePhone: '718-305-4000', Street: '7123 Penn Avenue, #3', City: 'Pittsburgh', State: 'PA', Zipcode: '15208' },
      { RegDate: '2/1/09 17:05', first_Name: 'Patrick', last_Name: 'Parker', Email_Address: 'qkika_farrell@jumpstartlab.com', HomePhone: '718-305-4000', Street: '4509 Frankford Avenue', City: 'Philadelphia', State: 'PA', Zipcode: '19214' },
      { RegDate: '2/1/09 20:53', first_Name: 'Scott', last_Name: 'Parker', Email_Address: 'qhuer321@jumpstartlab.com', HomePhone: '202-270-1000', Street: '19308 Alderbarn Ct', City: 'Brookeville', State: 'MD', Zipcode: '20833'}
    ]

    list_maker = ListMaker.new(entries)
    result = list_maker.process_email('qhuer321@jumpstartlab.com')

    assert_equal 1, result.count

    scott = result[0]

    assert_equal 'Parker', scott.last_name

  end

  def test_it_can_lookup_by_street
    entries = [
      { RegDate: '1/31/09 23:00', first_Name: 'Gregory', last_Name: 'Parker', Email_Address: 'jhopenh1@jumpstartlab.com', HomePhone: '718-305-4000', Street: '7123 Penn Avenue, #3', City: 'Pittsburgh', State: 'PA', Zipcode: '15208' },
      { RegDate: '2/1/09 17:05', first_Name: 'Patrick', last_Name: 'Parker', Email_Address: 'qkika_farrell@jumpstartlab.com', HomePhone: '718-305-4000', Street: '4509 Frankford Avenue', City: 'Philadelphia', State: 'PA', Zipcode: '19214' },
      { RegDate: '2/1/09 20:53', first_Name: 'Scott', last_Name: 'Parker', Email_Address: 'qhuer321@jumpstartlab.com', HomePhone: '202-270-1000', Street: '19308 Alderbarn Ct', City: 'Brookeville', State: 'MD', Zipcode: '20833'}
    ]

    list_maker = ListMaker.new(entries)
    result = list_maker.process_street('4509 Frankford Avenue')

    assert_equal 1, result.count

    patrick = result[0]

    assert_equal '718-305-4000', patrick.home_phone
    assert_equal 'Parker', patrick.last_name
  end

  def test_it_can_lookup_by_city
    entries = [
      { RegDate: '1/31/09 23:00', first_Name: 'Gregory', last_Name: 'Parker', Email_Address: 'jhopenh1@jumpstartlab.com', HomePhone: '718-305-4000', Street: '7123 Penn Avenue, #3', City: 'Pittsburgh', State: 'PA', Zipcode: '15208' },
      { RegDate: '2/1/09 17:05', first_Name: 'Patrick', last_Name: 'Parker', Email_Address: 'qkika_farrell@jumpstartlab.com', HomePhone: '718-305-4000', Street: '4509 Frankford Avenue', City: 'Philadelphia', State: 'PA', Zipcode: '19214' },
      { RegDate: '2/1/09 20:53', first_Name: 'Scott', last_Name: 'Parker', Email_Address: 'qhuer321@jumpstartlab.com', HomePhone: '202-270-1000', Street: '19308 Alderbarn Ct', City: 'Brookeville', State: 'MD', Zipcode: '20833'}
    ]

    list_maker = ListMaker.new(entries)
    result = list_maker.process_city('Philadelphia')

    assert_equal 1, result.count

    pat = result[0]

    assert_equal '718-305-4000', pat.home_phone
  end

  def test_it_can_lookup_by_state
    entries = [
      { RegDate: '1/31/09 23:00', first_Name: 'Gregory', last_Name: 'Parker', Email_Address: 'jhopenh1@jumpstartlab.com', HomePhone: '718-305-4000', Street: '7123 Penn Avenue, #3', City: 'Pittsburgh', State: 'PA', Zipcode: '15208' },
      { RegDate: '2/1/09 17:05', first_Name: 'Patrick', last_Name: 'Parker', Email_Address: 'qkika_farrell@jumpstartlab.com', HomePhone: '718-305-4000', Street: '4509 Frankford Avenue', City: 'Philadelphia', State: 'PA', Zipcode: '19214' },
      { RegDate: '2/1/09 20:53', first_Name: 'Scott', last_Name: 'Parker', Email_Address: 'qhuer321@jumpstartlab.com', HomePhone: '202-270-1000', Street: '19308 Alderbarn Ct', City: 'Brookeville', State: 'MD', Zipcode: '20833'}
    ]

    list_maker = ListMaker.new(entries)
    result = list_maker.process_state('PA')

    assert_equal 2, result.count

    greg, pat = result

    assert_equal '718-305-4000', pat.home_phone
    assert_equal '15208', greg.zipcode
  end

  def test_it_can_lookup_by_zipcode
    entries = [
      { RegDate: '1/31/09 23:00', first_Name: 'Gregory', last_Name: 'Parker', Email_Address: 'jhopenh1@jumpstartlab.com', HomePhone: '718-305-4000', Street: '7123 Penn Avenue, #3', City: 'Pittsburgh', State: 'PA', Zipcode: '15208' },
      { RegDate: '2/1/09 17:05', first_Name: 'Patrick', last_Name: 'Parker', Email_Address: 'qkika_farrell@jumpstartlab.com', HomePhone: '718-305-4000', Street: '4509 Frankford Avenue', City: 'Philadelphia', State: 'PA', Zipcode: '19214' },
      { RegDate: '2/1/09 20:53', first_Name: 'Scott', last_Name: 'Parker', Email_Address: 'qhuer321@jumpstartlab.com', HomePhone: '202-270-1000', Street: '19308 Alderbarn Ct', City: 'Brookeville', State: 'MD', Zipcode: '20833'}
    ]

    list_maker = ListMaker.new(entries)
    result = list_maker.process_zipcode('20833')

    assert_equal 1, result.count

    scott = result[0]

    assert_equal '202-270-1000', scott.home_phone
  end

end
