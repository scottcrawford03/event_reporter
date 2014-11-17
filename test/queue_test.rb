gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/queue'
require_relative '../lib/event_manager'

class QueueTest < Minitest::Test

  def test_that_the_queue_starts_empty
    previous_search = Queue.new
    assert previous_search.queue.empty?
  end

  def test_that_it_can_store_previous_search
    entries = [
      { RegDate: '1/31/09 23:00', first_Name: 'Gregory', last_Name: 'Parker', Email_Address: 'jhopenh1@jumpstartlab.com', HomePhone: '718-305-4000', Street: '7123 Penn Avenue, #3', City: 'Pittsburgh', State: 'PA', Zipcode: '15208' },
      { RegDate: '2/1/09 17:05', first_Name: 'Patrick', last_Name: 'Parker', Email_Address: 'qkika_farrell@jumpstartlab.com', HomePhone: '718-305-4000', Street: '4509 Frankford Avenue', City: 'Philadelphia', State: 'PA', Zipcode: '19214' },
      { RegDate: '2/1/09 20:53', first_Name: 'Scott', last_Name: 'Parker', Email_Address: 'qhuer321@jumpstartlab.com', HomePhone: '202-270-1000', Street: '19308 Alderbarn Ct', City: 'Brookeville', State: 'MD', Zipcode: '20833'}
    ]

    search = EventManager.new(entries)
    results = search.list_of_attendees.process_last_name('Parker')

    # added assertions to double check queue is pulling the right info
    assert_equal 3, results.count

    greg, pat, scott = results

    assert_equal "Gregory", greg.first_name
    assert_equal "Patrick", pat.first_name
    assert_equal "Scott", scott.first_name

    new_queue = Queue.new
    assert new_queue.queue.empty?

    new_queue.add(results)

    assert_equal 3, new_queue.queue.size
    refute new_queue.queue.empty?

    greg, pat, scott = new_queue.queue

    assert_equal "Gregory", greg.first_name
    assert_equal "Patrick", pat.first_name
    assert_equal "Scott", scott.first_name
  end

  def test_it_can_clear
    entries = [
      { RegDate: '1/31/09 23:00', first_Name: 'Gregory', last_Name: 'Parker', Email_Address: 'jhopenh1@jumpstartlab.com', HomePhone: '718-305-4000', Street: '7123 Penn Avenue, #3', City: 'Pittsburgh', State: 'PA', Zipcode: '15208' },
      { RegDate: '2/1/09 17:05', first_Name: 'Patrick', last_Name: 'Parker', Email_Address: 'qkika_farrell@jumpstartlab.com', HomePhone: '718-305-4000', Street: '4509 Frankford Avenue', City: 'Philadelphia', State: 'PA', Zipcode: '19214' },
      { RegDate: '2/1/09 20:53', first_Name: 'Scott', last_Name: 'Parker', Email_Address: 'qhuer321@jumpstartlab.com', HomePhone: '202-270-1000', Street: '19308 Alderbarn Ct', City: 'Brookeville', State: 'MD', Zipcode: '20833'}
    ]

    search = EventManager.new(entries)
    results = search.list_of_attendees.process_last_name('Parker')

    new_queue = Queue.new
    assert new_queue.empty?

    new_queue.add(results)

    assert_equal 3, new_queue.size?
    refute new_queue.empty?

    new_queue.clear

    assert_equal 0, new_queue.size?
  end

end
