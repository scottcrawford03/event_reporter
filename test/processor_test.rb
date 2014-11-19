require_relative '../test_helper'
require_relative '../lib/processor'

class ProcessorTest < Minitest::Test

  def test_it_splits_input_into_three_categories
    skip
    command = "Find first_name Gregory"
    processor = Processor.new("input", "output")
    processor.process_commands(command)

    assert_equal ['Find'], processor.instruction
    assert_equal ['first_name'], processor.criteria
    assert_equal ['Gregory'], processor.attribute
  end

  def test_it_saves_it_to_three_different_values
    skip
    command = "Find first_name Gregory"
    processor = Processor.new("input", "output")
    processor.process(command)

    assert_equal 'Find', processor.instruction
    assert_equal 'first_name', processor.criteria
    assert_equal 'Gregory', processor.attribute
  end

  def test_it_accounts_for_to_or_by
    command = %w(queue print by Gregory)
    processor = Processor.new("input", "output")
    processor.account_for_to_or_by(command)

    assert_equal %w(queue print Gregory), command
  end

  def test_the_queue_starts_empty
    processor = Processor.new('input','output')
    assert processor.new_queue.empty?
  end

  def test_the_queue_clears
    processor = Processor.new('input','output')
    assert processor.new_queue.empty?

    processor.new_queue << [
      { regdate: '1/31/09 23:00', first_name: 'Gregory', last_name: 'Parker', email_address: 'jhopenh1@jumpstartlab.com', homephone: '718-305-4000', street: '7123 Penn Avenue, #3', city: 'Pittsburgh', state: 'PA', zipcode: '15208' },
      { regdate: '2/1/09 17:05', first_name: 'Patrick', last_name: 'Parker', email_address: 'qkika_farrell@jumpstartlab.com', homephone: '718-305-4000', street: '4509 Frankford Avenue', city: 'Philadelphia', state: 'PA', zipcode: '19214' },
      { regdate: '2/1/09 20:53', first_name: 'Scott', last_name: 'Parker', email_address: 'qhuer321@jumpstartlab.com', homephone: '202-270-1000', street: '19308 Alderbarn Ct', city: 'Brookeville', state: 'MD', zipcode: '20833'}
    ]
    refute processor.new_queue.empty?

    processor.new_queue.clear
    assert processor.new_queue.empty?
  end

  def test_it_can_add_to_the_queue
    processor = Processor.new('input','output')
    assert processor.new_queue.empty?

    processor.new_queue << [
      { regdate: '1/31/09 23:00', first_name: 'Gregory', last_name: 'Parker', email_address: 'jhopenh1@jumpstartlab.com', homephone: '718-305-4000', street: '7123 Penn Avenue, #3', city: 'Pittsburgh', state: 'PA', zipcode: '15208' },
      { regdate: '2/1/09 17:05', first_name: 'Patrick', last_name: 'Parker', email_address: 'qkika_farrell@jumpstartlab.com', homephone: '718-305-4000', street: '4509 Frankford Avenue', city: 'Philadelphia', state: 'PA', zipcode: '19214' },
      { regdate: '2/1/09 20:53', first_name: 'Scott', last_name: 'Parker', email_address: 'qhuer321@jumpstartlab.com', homephone: '202-270-1000', street: '19308 Alderbarn Ct', city: 'Brookeville', state: 'MD', zipcode: '20833'}
    ]

    refute processor.new_queue.empty?
  end

  def test_it_can_count_the_queue
    processor = Processor.new('input','output')
    assert processor.new_queue.empty?

    processor.new_queue << [
      { regdate: '1/31/09 23:00', first_name: 'Gregory', last_name: 'Parker', email_address: 'jhopenh1@jumpstartlab.com', homephone: '718-305-4000', street: '7123 Penn Avenue, #3', city: 'Pittsburgh', state: 'PA', zipcode: '15208' },
    ]

    refute processor.new_queue.empty?
    assert_equal 1, processor.new_queue.count
  end
end
