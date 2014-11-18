require_relative '../test_helper'
require_relative '../lib/processor'

class ProcessorTest < Minitest::Test

  def test_it_splits_input_into_three_categories
    skip
    command = "Find first_name Gregory"
    processor = Processor.new("input", "output")
    processed_array = processor.process(command)

    assert_equal ['Find', 'first_name', 'Gregory'], processed_array
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
end
