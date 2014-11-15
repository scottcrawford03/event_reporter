gem 'minitest', '~> 5.2'                 # => true
require 'minitest/autorun'               # => true
require 'minitest/pride'                 # => true
require_relative '../lib/event_manager'  # => true

class EventManagerTest < Minitest::Test
  def test_it_lookup_by_last_name
    entries = [
      { first_Name: 'Gregory', last_Name: 'Parker', HomePhone: '718-305-4000' },  # => {:first_Name=>"Gregory", :last_Name=>"Parker", :HomePhone=>"718-305-4000"}
      { first_Name: 'Patrick', last_Name: 'Parker', HomePhone: '718-305-4000' },  # => {:first_Name=>"Patrick", :last_Name=>"Parker", :HomePhone=>"718-305-4000"}
      { first_Name: 'Cindy', last_Name: 'Johnson', HomePhone: '333.333.3333' }    # => {:first_Name=>"Cindy", :last_Name=>"Johnson", :HomePhone=>"333.333.3333"}
    ]                                                                             # => [{:first_Name=>"Gregory", :last_Name=>"Parker", :HomePhone=>"718-305-4000"}, {:first_Name=>"Patrick", :last_Name=>"Parker", :HomePhone=>"718-305-4000"}, {:first_Name=>"Cindy", :last_Name=>"Johnson", :HomePhone=>"333.333.3333"}]

    event_manager = EventManager.new(entries)              # => #<EventManager:0x007fd99a8e6108 @reporters=[#<Reporters:0x007fd99a8e6090 @date=nil, @first_name="Gregory", @last_name="Parker", @email=nil, @home_phone="718-305-4000", @street=nil, @city=nil, @state=nil, @zipcode=nil>, #<Reporters:0x007fd99a8e6068 @date=nil, @first_name="Patrick", @last_name="Parker", @email=nil, @home_phone="718-305-4000", @street=nil, @city=nil, @state=nil, @zipcode=nil>, #<Reporters:0x007fd99a8e6040 @date=nil, @first_name="Cindy", @last_name="Johnson", @email=nil, @home_phone="333.333.3333", @street=nil, @city=nil, @state=nil, @zipcode=nil>]>
    result = event_manager.look_up_by_last_name("Parker")  # => [#<Reporters:0x007fd99a8e6090 @date=nil, @first_name="Gregory", @last_name="Parker", @email=nil, @home_phone="718-305-4000", @street=nil, @city=nil, @state=nil, @zipcode=nil>, #<Reporters:0x007fd99a8e6068 @date=nil, @first_name="Patrick", @last_name="Parker", @email=nil, @home_phone="718-305-4000", @street=nil, @city=nil, @state=nil, @zipcode=nil>]

    assert_equal 2, result.count

    greg, pat = result

    assert_equal "Gregory", greg.first_name
    assert_equal "Patrick", pat.first_name# => true
  end
end

# >> Run options: --seed 21824
# >>
# >> # Running:
# >>
# >> [38;5;154m.[0m
# >>
# >> [38;5;154mF[0m[38;5;154ma[0m[38;5;148mb[0m[38;5;184mu[0m[38;5;184ml[0m[38;5;214mo[0m[38;5;214mu[0m[38;5;208ms[0m[38;5;208m [0m[38;5;203mr[0m[38;5;203mu[0m[38;5;198mn[0m in 0.002192s, 456.2044 runs/s, 456.2044 assertions/s.
# >>
# >> 1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
