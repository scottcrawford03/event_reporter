gem 'minitest', '~> 5.2'              # => true
require 'minitest/autorun'            # => true
require 'minitest/pride'              # => true
require_relative '../lib/queue'       # => true
require_relative '../lib/list_maker'  # => true

class QueueTest < Minitest::Test

  def test_that_the_queue_starts_empty
    previous_search = Queue.new          # => #<Thread::Queue:0x007fbd530a72c0 @queue=[]>
    assert previous_search.queue.empty?  # => true
  end

  def test_that_it_can_store_previous_search
    entries = [
      { regdate: '1/31/09 23:00', first_name: 'Gregory', last_name: 'Parker', email_address: 'jhopenh1@jumpstartlab.com', homephone: '718-305-4000', street: '7123 Penn Avenue, #3', city: 'Pittsburgh', state: 'PA', zipcode: '15208' },         # => {:regdate=>"1/31/09 23:00", :first_name=>"Gregory", :last_name=>"Parker", :email_address=>"jhopenh1@jumpstartlab.com", :homephone=>"718-305-4000", :street=>"7123 Penn Avenue, #3", :city=>"Pittsburgh", :state=>"PA", :zipcode=>"15208"}
      { regdate: '2/1/09 17:05', first_name: 'Patrick', last_name: 'Parker', email_address: 'qkika_farrell@jumpstartlab.com', homephone: '718-305-4000', street: '4509 Frankford Avenue', city: 'Philadelphia', state: 'PA', zipcode: '19214' },  # => {:regdate=>"2/1/09 17:05", :first_name=>"Patrick", :last_name=>"Parker", :email_address=>"qkika_farrell@jumpstartlab.com", :homephone=>"718-305-4000", :street=>"4509 Frankford Avenue", :city=>"Philadelphia", :state=>"PA", :zipcode=>"19214"}
      { regdate: '2/1/09 20:53', first_name: 'Scott', last_name: 'Parker', email_address: 'qhuer321@jumpstartlab.com', homephone: '202-270-1000', street: '19308 Alderbarn Ct', city: 'Brookeville', state: 'MD', zipcode: '20833'}               # => {:regdate=>"2/1/09 20:53", :first_name=>"Scott", :last_name=>"Parker", :email_address=>"qhuer321@jumpstartlab.com", :homephone=>"202-270-1000", :street=>"19308 Alderbarn Ct", :city=>"Brookeville", :state=>"MD", :zipcode=>"20833"}
    ]                                                                                                                                                                                                                                             # => [{:regdate=>"1/31/09 23:00", :first_name=>"Gregory", :last_name=>"Parker", :email_address=>"jhopenh1@jumpstartlab.com", :homephone=>"718-305-4000", :street=>"7123 Penn Avenue, #3", :city=>"Pittsburgh", :state=>"PA", :zipcode=>"15208"}, {:regdate=>"2/1/09 17:05", :first_name=>"Patrick", :last_name=>"Parker", :email_address=>"qkika_farrell@jumpstartlab.com", :homephone=>"718-305-4000", :street=>"4509 Frankford Avenue", :city=>"Philadelphia", :state=>"PA", :zipcode=>"19214"}, {:regdate=>"2/1/09 20:53", :first_name=>"Scott", :last_name=>"Parker", :email_address=>"qhuer321@jumpstartlab.com", :homephone=>"202-270-1000", :street=>"19308 Alderbarn Ct", :city=>"Brookeville", :state=>"MD", :zipcode=>"20833"}]

    search = ListMaker.new(entries)                           # => #<ListMaker:0x007fbd5309d7c0 @organized_list_of_attendees=[#<Attendee:0x007fbd5309d658 @date="1/31/09 23:00", @first_name="Gregory", @last_name="Parker", @email="jhopenh1@jumpstartlab.com", @home_phone="718-305-4000", @street="7123 Penn Avenue, #3", @city="Pittsburgh", @state="PA", @zipcode="15208">, #<Attendee:0x007fbd5309d5e0 @date="2/1/09 17:05", @first_name="Patrick", @last_name="Parker", @email="qkika_farrell@jumpstartlab.com", @home_phone="718-305-4000", @street="4509 Frankford Avenue", @city="Philadelphia", @state="PA", @zipcode="19214">, #<Attendee:0x007fbd5309d5b8 @date="2/1/09 20:53", @first_name="Scott", @last_name="Parker", @email="qhuer321@jumpstartlab.com", @home_phone="202-270-1000", @street="19308 Alderbarn Ct", @city="Brookeville", @state="MD", @zipcode="20833">]>
    results = search.process_attribute('last_name','Parker')  # => [#<Attendee:0x007fbd5309d658 @date="1/31/09 23:00", @first_name="Gregory", @last_name="Parker", @email="jhopenh1@jumpstartlab.com", @home_phone="718-305-4000", @street="7123 Penn Avenue, #3", @city="Pittsburgh", @state="PA", @zipcode="15208">, #<Attendee:0x007fbd5309d5e0 @date="2/1/09 17:05", @first_name="Patrick", @last_name="Parker", @email="qkika_farrell@jumpstartlab.com", @home_phone="718-305-4000", @street="4509 Frankford Avenue", @city="Philadelphia", @state="PA", @zipcode="19214">, #<Attendee:0x007fbd5309d5b8 @date="2/1/09 20:53", @first_name="Scott", @last_name="Parker", @email="qhuer321@jumpstartlab.com", @home_phone="202-270-1000", @street="19308 Alderbarn Ct", @city="Brookeville", @state="MD", @zipcode="20833">]

    new_queue = Queue.new          # => #<Thread::Queue:0x007fbd53097b18 @queue=[]>
    assert new_queue.queue.empty?  # => true

    new_queue = results  # => [#<Attendee:0x007fbd5309d658 @date="1/31/09 23:00", @first_name="Gregory", @last_name="Parker", @email="jhopenh1@jumpstartlab.com", @home_phone="718-305-4000", @street="7123 Penn Avenue, #3", @city="Pittsburgh", @state="PA", @zipcode="15208">, #<Attendee:0x007fbd5309d5e0 @date="2/1/09 17:05", @first_name="Patrick", @last_name="Parker", @email="qkika_farrell@jumpstartlab.com", @home_phone="718-305-4000", @street="4509 Frankford Avenue", @city="Philadelphia", @state="PA", @zipcode="19214">, #<Attendee:0x007fbd5309d5b8 @date="2/1/09 20:53", @first_name="Scott", @last_name="Parker", @email="qhuer321@jumpstartlab.com", @home_phone="202-270-1000", @street="19308 Alderbarn Ct", @city="Brookeville", @state="MD", @zipcode="20833">]

    assert_equal 3, new_queue.size  # => true
    refute new_queue.empty?         # => false
  end

  def test_it_can_clear
    entries = [
      { regdate: '1/31/09 23:00', first_name: 'Gregory', last_name: 'Parker', email_address: 'jhopenh1@jumpstartlab.com', homephone: '718-305-4000', street: '7123 Penn Avenue, #3', city: 'Pittsburgh', state: 'PA', zipcode: '15208' },         # => {:regdate=>"1/31/09 23:00", :first_name=>"Gregory", :last_name=>"Parker", :email_address=>"jhopenh1@jumpstartlab.com", :homephone=>"718-305-4000", :street=>"7123 Penn Avenue, #3", :city=>"Pittsburgh", :state=>"PA", :zipcode=>"15208"}
      { regdate: '2/1/09 17:05', first_name: 'Patrick', last_name: 'Parker', email_address: 'qkika_farrell@jumpstartlab.com', homephone: '718-305-4000', street: '4509 Frankford Avenue', city: 'Philadelphia', state: 'PA', zipcode: '19214' },  # => {:regdate=>"2/1/09 17:05", :first_name=>"Patrick", :last_name=>"Parker", :email_address=>"qkika_farrell@jumpstartlab.com", :homephone=>"718-305-4000", :street=>"4509 Frankford Avenue", :city=>"Philadelphia", :state=>"PA", :zipcode=>"19214"}
      { regdate: '2/1/09 20:53', first_name: 'Scott', last_name: 'Parker', email_address: 'qhuer321@jumpstartlab.com', homephone: '202-270-1000', street: '19308 Alderbarn Ct', city: 'Brookeville', state: 'MD', zipcode: '20833'}               # => {:regdate=>"2/1/09 20:53", :first_name=>"Scott", :last_name=>"Parker", :email_address=>"qhuer321@jumpstartlab.com", :homephone=>"202-270-1000", :street=>"19308 Alderbarn Ct", :city=>"Brookeville", :state=>"MD", :zipcode=>"20833"}
    ]                                                                                                                                                                                                                                             # => [{:regdate=>"1/31/09 23:00", :first_name=>"Gregory", :last_name=>"Parker", :email_address=>"jhopenh1@jumpstartlab.com", :homephone=>"718-305-4000", :street=>"7123 Penn Avenue, #3", :city=>"Pittsburgh", :state=>"PA", :zipcode=>"15208"}, {:regdate=>"2/1/09 17:05", :first_name=>"Patrick", :last_name=>"Parker", :email_address=>"qkika_farrell@jumpstartlab.com", :homephone=>"718-305-4000", :street=>"4509 Frankford Avenue", :city=>"Philadelphia", :state=>"PA", :zipcode=>"19214"}, {:regdate=>"2/1/09 20:53", :first_name=>"Scott", :last_name=>"Parker", :email_address=>"qhuer321@jumpstartlab.com", :homephone=>"202-270-1000", :street=>"19308 Alderbarn Ct", :city=>"Brookeville", :state=>"MD", :zipcode=>"20833"}]

    search = ListMaker.new(entries)                            # => #<ListMaker:0x007fbd530b4970 @organized_list_of_attendees=[#<Attendee:0x007fbd530b4150 @date="1/31/09 23:00", @first_name="Gregory", @last_name="Parker", @email="jhopenh1@jumpstartlab.com", @home_phone="718-305-4000", @street="7123 Penn Avenue, #3", @city="Pittsburgh", @state="PA", @zipcode="15208">, #<Attendee:0x007fbd530b4128 @date="2/1/09 17:05", @first_name="Patrick", @last_name="Parker", @email="qkika_farrell@jumpstartlab.com", @home_phone="718-305-4000", @street="4509 Frankford Avenue", @city="Philadelphia", @state="PA", @zipcode="19214">, #<Attendee:0x007fbd530b40b0 @date="2/1/09 20:53", @first_name="Scott", @last_name="Parker", @email="qhuer321@jumpstartlab.com", @home_phone="202-270-1000", @street="19308 Alderbarn Ct", @city="Brookeville", @state="MD", @zipcode="20833">]>
    results = search.process_attribute('last_name', 'Parker')  # => [#<Attendee:0x007fbd530b4150 @date="1/31/09 23:00", @first_name="Gregory", @last_name="Parker", @email="jhopenh1@jumpstartlab.com", @home_phone="718-305-4000", @street="7123 Penn Avenue, #3", @city="Pittsburgh", @state="PA", @zipcode="15208">, #<Attendee:0x007fbd530b4128 @date="2/1/09 17:05", @first_name="Patrick", @last_name="Parker", @email="qkika_farrell@jumpstartlab.com", @home_phone="718-305-4000", @street="4509 Frankford Avenue", @city="Philadelphia", @state="PA", @zipcode="19214">, #<Attendee:0x007fbd530b40b0 @date="2/1/09 20:53", @first_name="Scott", @last_name="Parker", @email="qhuer321@jumpstartlab.com", @home_phone="202-270-1000", @street="19308 Alderbarn Ct", @city="Brookeville", @state="MD", @zipcode="20833">]

    new_queue = Queue.new    # => #<Thread::Queue:0x007fbd530add00 @queue=[]>
    assert new_queue.empty?  # => true

    new_queue = results  # => [#<Attendee:0x007fbd530b4150 @date="1/31/09 23:00", @first_name="Gregory", @last_name="Parker", @email="jhopenh1@jumpstartlab.com", @home_phone="718-305-4000", @street="7123 Penn Avenue, #3", @city="Pittsburgh", @state="PA", @zipcode="15208">, #<Attendee:0x007fbd530b4128 @date="2/1/09 17:05", @first_name="Patrick", @last_name="Parker", @email="qkika_farrell@jumpstartlab.com", @home_phone="718-305-4000", @street="4509 Frankford Avenue", @city="Philadelphia", @state="PA", @zipcode="19214">, #<Attendee:0x007fbd530b40b0 @date="2/1/09 20:53", @first_name="Scott", @last_name="Parker", @email="qhuer321@jumpstartlab.com", @home_phone="202-270-1000", @street="19308 Alderbarn Ct", @city="Brookeville", @state="MD", @zipcode="20833">]

    assert_equal 3, new_queue.size  # => true
    refute new_queue.empty?         # => false

    new_queue.clear  # => []

    assert_equal 0, new_queue.size
  end

end

# >> Run options: --seed 39558
# >>
# >> # Running:
# >>
# >> [41m[37mE[0m[31m*[0m[32m*[0m
# >>
# >> [31mF[0m[32ma[0m[33mb[0m[34mu[0m[35ml[0m[36mo[0m[31mu[0m[32ms[0m[33m [0m[34mr[0m[35mu[0m[36mn[0m in 0.001610s, 1863.3540 runs/s, 4347.8261 assertions/s.
# >>
# >>   1) Error:
# >> QueueTest#test_it_can_clear:
# >> NoMethodError: undefined method `size?' for []:Array
# >>     /Users/scottcrawford/Turing/event_reporter/test/queue_test.rb:53:in `test_it_can_clear'
# >>
# >> 3 runs, 7 assertions, 0 failures, 1 errors, 0 skips
