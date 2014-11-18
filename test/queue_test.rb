gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/queue'
require_relative '../lib/list_maker'

class QueueTest < Minitest::Test

  def test_that_the_queue_starts_empty
    previous_search = Queue.new
    assert previous_search.queue.empty?
  end

  def test_that_it_can_store_previous_search
    entries = [
      { regdate: '1/31/09 23:00', first_name: 'Gregory', last_name: 'Parker', email_address: 'jhopenh1@jumpstartlab.com', homephone: '718-305-4000', street: '7123 Penn Avenue, #3', city: 'Pittsburgh', state: 'PA', zipcode: '15208' },
      { regdate: '2/1/09 17:05', first_name: 'Patrick', last_name: 'Parker', email_address: 'qkika_farrell@jumpstartlab.com', homephone: '718-305-4000', street: '4509 Frankford Avenue', city: 'Philadelphia', state: 'PA', zipcode: '19214' },
      { regdate: '2/1/09 20:53', first_name: 'Scott', last_name: 'Parker', email_address: 'qhuer321@jumpstartlab.com', homephone: '202-270-1000', street: '19308 Alderbarn Ct', city: 'Brookeville', state: 'MD', zipcode: '20833'}
    ]

    search = ListMaker.new(entries)
    results = search.process_attribute('last_name','Parker')

    new_queue = Queue.new
    assert new_queue.queue.empty?

    new_queue.add(results)

    assert_equal 3, new_queue.queue.size
    refute new_queue.queue.empty?
  end

  def test_it_can_clear
    entries = [
      { regdate: '1/31/09 23:00', first_name: 'Gregory', last_name: 'Parker', email_address: 'jhopenh1@jumpstartlab.com', homephone: '718-305-4000', street: '7123 Penn Avenue, #3', city: 'Pittsburgh', state: 'PA', zipcode: '15208' },
      { regdate: '2/1/09 17:05', first_name: 'Patrick', last_name: 'Parker', email_address: 'qkika_farrell@jumpstartlab.com', homephone: '718-305-4000', street: '4509 Frankford Avenue', city: 'Philadelphia', state: 'PA', zipcode: '19214' },
      { regdate: '2/1/09 20:53', first_name: 'Scott', last_name: 'Parker', email_address: 'qhuer321@jumpstartlab.com', homephone: '202-270-1000', street: '19308 Alderbarn Ct', city: 'Brookeville', state: 'MD', zipcode: '20833'}
    ]

    search = ListMaker.new(entries)
    results = search.process_attribute('last_name', 'Parker')

    new_queue = Queue.new
    assert new_queue.empty?

    new_queue.add(results)

    assert_equal 3, new_queue.size?
    refute new_queue.empty?

    new_queue.clear

    assert_equal 0, new_queue.size?
  end

end
