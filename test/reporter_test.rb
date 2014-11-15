gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

class ReporterTest < Minitest::Test
  def test_reporters_attributes
    data = {
      first_name: 'Alice',
      last_name: 'Smith',
      phone_number: '111.111.1111'
    }
    entry = Reporters.new(data)

    assert_equal 'Alice', entry.first_name
    assert_equal 'Smith', entry.last_name
    assert_equal 'Alice Smith', entry.name
    assert_equal '111.111.1111', entry.phone_number
  end
end
