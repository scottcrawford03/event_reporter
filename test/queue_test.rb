gem 'minitest', '~> 5.2'                 # => true
require 'minitest/autorun'               # => true
require 'minitest/pride'                 # => true
require_relative '../lib/queue'          # => true
require_relative '../lib/event_manager'  # => true

class QueueTest < Minitest::Test

  def test_that_the_queue_starts_empty
    previous_search = Queue.new          # => #<Thread::Queue:0x007fc90a9defd8 @queue=[]>
    assert previous_search.queue.empty?  # => true
  end

  def test_that_it_can_store_previous_search
    entries = [
      { RegDate: '1/31/09 23:00', first_Name: 'Gregory', last_Name: 'Parker', Email_Address: 'jhopenh1@jumpstartlab.com', HomePhone: '718-305-4000', Street: '7123 Penn Avenue, #3', City: 'Pittsburgh', State: 'PA', Zipcode: '15208' },         # => {:RegDate=>"1/31/09 23:00", :first_Name=>"Gregory", :last_Name=>"Parker", :Email_Address=>"jhopenh1@jumpstartlab.com", :HomePhone=>"718-305-4000", :Street=>"7123 Penn Avenue, #3", :City=>"Pittsburgh", :State=>"PA", :Zipcode=>"15208"}
      { RegDate: '2/1/09 17:05', first_Name: 'Patrick', last_Name: 'Parker', Email_Address: 'qkika_farrell@jumpstartlab.com', HomePhone: '718-305-4000', Street: '4509 Frankford Avenue', City: 'Philadelphia', State: 'PA', Zipcode: '19214' },  # => {:RegDate=>"2/1/09 17:05", :first_Name=>"Patrick", :last_Name=>"Parker", :Email_Address=>"qkika_farrell@jumpstartlab.com", :HomePhone=>"718-305-4000", :Street=>"4509 Frankford Avenue", :City=>"Philadelphia", :State=>"PA", :Zipcode=>"19214"}
      { RegDate: '2/1/09 20:53', first_Name: 'Scott', last_Name: 'Parker', Email_Address: 'qhuer321@jumpstartlab.com', HomePhone: '202-270-1000', Street: '19308 Alderbarn Ct', City: 'Brookeville', State: 'MD', Zipcode: '20833'}               # => {:RegDate=>"2/1/09 20:53", :first_Name=>"Scott", :last_Name=>"Parker", :Email_Address=>"qhuer321@jumpstartlab.com", :HomePhone=>"202-270-1000", :Street=>"19308 Alderbarn Ct", :City=>"Brookeville", :State=>"MD", :Zipcode=>"20833"}
    ]                                                                                                                                                                                                                                             # => [{:RegDate=>"1/31/09 23:00", :first_Name=>"Gregory", :last_Name=>"Parker", :Email_Address=>"jhopenh1@jumpstartlab.com", :HomePhone=>"718-305-4000", :Street=>"7123 Penn Avenue, #3", :City=>"Pittsburgh", :State=>"PA", :Zipcode=>"15208"}, {:RegDate=>"2/1/09 17:05", :first_Name=>"Patrick", :last_Name=>"Parker", :Email_Address=>"qkika_farrell@jumpstartlab.com", :HomePhone=>"718-305-4000", :Street=>"4509 Frankford Avenue", :City=>"Philadelphia", :State=>"PA", :Zipcode=>"19214"}, {:RegDate=>"2/1/09 20:53", :first_Name=>"Scott", :last_Name=>"Parker", :Email_Address=>"qhuer321@jumpstartlab.com", :HomePhone=>"202-270-1000", :Street=>"19308 Alderbarn Ct", :City=>"Brookeville", :State=>"MD", :Zipcode=>"20833"}]

    search = EventManager.new(entries)                              # => #<EventManager:0x007fc90a9d5528 @list_of_attendees=#<ListMaker:0x007fc90a9d5460 @organized_list_of_attendees=[#<Attendees:0x007fc90a9d5398 @date="1/31/09 23:00", @first_name="Gregory", @last_name="Parker", @email="jhopenh1@jumpstartlab.com", @home_phone="718-305-4000", @street="7123 Penn Avenue, #3", @city="Pittsburgh", @state="PA", @zipcode="15208">, #<Attendees:0x007fc90a9d5370 @date="2/1/09 17:05", @first_name="Patrick", @last_name="Parker", @email="qkika_farrell@jumpstartlab.com", @home_phone="718-305-4000", @street="4509 Frankford Avenue", @city="Philadelphia", @state="PA", @zipcode="19214">, #<Attendees:0x007fc90a9d5348 @date="2/1/09 20:53", @first_name="Scott", @last_name="Parker", @email="qhuer321@jumpstartlab.com", @home_phone="202-270-1000", @street="19308 Alderbarn Ct", @city="Brookeville", @state="MD", @zipcode="20833">]>>
    results = search.list_of_attendees.process_last_name('Parker')  # => [#<Attendees:0x007fc90a9d5398 @date="1/31/09 23:00", @first_name="Gregory", @last_name="Parker", @email="jhopenh1@jumpstartlab.com", @home_phone="718-305-4000", @street="7123 Penn Avenue, #3", @city="Pittsburgh", @state="PA", @zipcode="15208">, #<Attendees:0x007fc90a9d5370 @date="2/1/09 17:05", @first_name="Patrick", @last_name="Parker", @email="qkika_farrell@jumpstartlab.com", @home_phone="718-305-4000", @street="4509 Frankford Avenue", @city="Philadelphia", @state="PA", @zipcode="19214">, #<Attendees:0x007fc90a9d5348 @date="2/1/09 20:53", @first_name="Scott", @last_name="Parker", @email="qhuer321@jumpstartlab.com", @home_phone="202-270-1000", @street="19308 Alderbarn Ct", @city="Brookeville", @state="MD", @zipcode="20833">]

    new_queue = Queue.new          # => #<Thread::Queue:0x007fc90a9d4e70 @queue=[]>
    assert new_queue.queue.empty?  # => true

    new_queue.add(results)  # => [#<Attendees:0x007fc90a9d5398 @date="1/31/09 23:00", @first_name="Gregory", @last_name="Parker", @email="jhopenh1@jumpstartlab.com", @home_phone="718-305-4000", @street="7123 Penn Avenue, #3", @city="Pittsburgh", @state="PA", @zipcode="15208">, #<Attendees:0x007fc90a9d5370 @date="2/1/09 17:05", @first_name="Patrick", @last_name="Parker", @email="qkika_farrell@jumpstartlab.com", @home_phone="718-305-4000", @street="4509 Frankford Avenue", @city="Philadelphia", @state="PA", @zipcode="19214">, #<Attendees:0x007fc90a9d5348 @date="2/1/09 20:53", @first_name="Scott", @last_name="Parker", @email="qhuer321@jumpstartlab.com", @home_phone="202-270-1000", @street="19308 Alderbarn Ct", @city="Brookeville", @state="MD", @zipcode="20833">]

    assert_equal 3, new_queue.queue.size  # => true
    refute new_queue.queue.empty?         # => false
  end

  def test_it_can_clear
    entries = [
      { RegDate: '1/31/09 23:00', first_Name: 'Gregory', last_Name: 'Parker', Email_Address: 'jhopenh1@jumpstartlab.com', HomePhone: '718-305-4000', Street: '7123 Penn Avenue, #3', City: 'Pittsburgh', State: 'PA', Zipcode: '15208' },         # => {:RegDate=>"1/31/09 23:00", :first_Name=>"Gregory", :last_Name=>"Parker", :Email_Address=>"jhopenh1@jumpstartlab.com", :HomePhone=>"718-305-4000", :Street=>"7123 Penn Avenue, #3", :City=>"Pittsburgh", :State=>"PA", :Zipcode=>"15208"}
      { RegDate: '2/1/09 17:05', first_Name: 'Patrick', last_Name: 'Parker', Email_Address: 'qkika_farrell@jumpstartlab.com', HomePhone: '718-305-4000', Street: '4509 Frankford Avenue', City: 'Philadelphia', State: 'PA', Zipcode: '19214' },  # => {:RegDate=>"2/1/09 17:05", :first_Name=>"Patrick", :last_Name=>"Parker", :Email_Address=>"qkika_farrell@jumpstartlab.com", :HomePhone=>"718-305-4000", :Street=>"4509 Frankford Avenue", :City=>"Philadelphia", :State=>"PA", :Zipcode=>"19214"}
      { RegDate: '2/1/09 20:53', first_Name: 'Scott', last_Name: 'Parker', Email_Address: 'qhuer321@jumpstartlab.com', HomePhone: '202-270-1000', Street: '19308 Alderbarn Ct', City: 'Brookeville', State: 'MD', Zipcode: '20833'}               # => {:RegDate=>"2/1/09 20:53", :first_Name=>"Scott", :last_Name=>"Parker", :Email_Address=>"qhuer321@jumpstartlab.com", :HomePhone=>"202-270-1000", :Street=>"19308 Alderbarn Ct", :City=>"Brookeville", :State=>"MD", :Zipcode=>"20833"}
    ]                                                                                                                                                                                                                                             # => [{:RegDate=>"1/31/09 23:00", :first_Name=>"Gregory", :last_Name=>"Parker", :Email_Address=>"jhopenh1@jumpstartlab.com", :HomePhone=>"718-305-4000", :Street=>"7123 Penn Avenue, #3", :City=>"Pittsburgh", :State=>"PA", :Zipcode=>"15208"}, {:RegDate=>"2/1/09 17:05", :first_Name=>"Patrick", :last_Name=>"Parker", :Email_Address=>"qkika_farrell@jumpstartlab.com", :HomePhone=>"718-305-4000", :Street=>"4509 Frankford Avenue", :City=>"Philadelphia", :State=>"PA", :Zipcode=>"19214"}, {:RegDate=>"2/1/09 20:53", :first_Name=>"Scott", :last_Name=>"Parker", :Email_Address=>"qhuer321@jumpstartlab.com", :HomePhone=>"202-270-1000", :Street=>"19308 Alderbarn Ct", :City=>"Brookeville", :State=>"MD", :Zipcode=>"20833"}]

    search = EventManager.new(entries)                              # => #<EventManager:0x007fc90a9e6800 @list_of_attendees=#<ListMaker:0x007fc90a9e6788 @organized_list_of_attendees=[#<Attendees:0x007fc90a9e6648 @date="1/31/09 23:00", @first_name="Gregory", @last_name="Parker", @email="jhopenh1@jumpstartlab.com", @home_phone="718-305-4000", @street="7123 Penn Avenue, #3", @city="Pittsburgh", @state="PA", @zipcode="15208">, #<Attendees:0x007fc90a9e6620 @date="2/1/09 17:05", @first_name="Patrick", @last_name="Parker", @email="qkika_farrell@jumpstartlab.com", @home_phone="718-305-4000", @street="4509 Frankford Avenue", @city="Philadelphia", @state="PA", @zipcode="19214">, #<Attendees:0x007fc90a9e65d0 @date="2/1/09 20:53", @first_name="Scott", @last_name="Parker", @email="qhuer321@jumpstartlab.com", @home_phone="202-270-1000", @street="19308 Alderbarn Ct", @city="Brookeville", @state="MD", @zipcode="20833">]>>
    results = search.list_of_attendees.process_last_name('Parker')  # => [#<Attendees:0x007fc90a9e6648 @date="1/31/09 23:00", @first_name="Gregory", @last_name="Parker", @email="jhopenh1@jumpstartlab.com", @home_phone="718-305-4000", @street="7123 Penn Avenue, #3", @city="Pittsburgh", @state="PA", @zipcode="15208">, #<Attendees:0x007fc90a9e6620 @date="2/1/09 17:05", @first_name="Patrick", @last_name="Parker", @email="qkika_farrell@jumpstartlab.com", @home_phone="718-305-4000", @street="4509 Frankford Avenue", @city="Philadelphia", @state="PA", @zipcode="19214">, #<Attendees:0x007fc90a9e65d0 @date="2/1/09 20:53", @first_name="Scott", @last_name="Parker", @email="qhuer321@jumpstartlab.com", @home_phone="202-270-1000", @street="19308 Alderbarn Ct", @city="Brookeville", @state="MD", @zipcode="20833">]

    new_queue = Queue.new    # => #<Thread::Queue:0x007fc90a9e4c08 @queue=[]>
    assert new_queue.empty?  # => true

    new_queue.add(results)  # => [#<Attendees:0x007fc90a9e6648 @date="1/31/09 23:00", @first_name="Gregory", @last_name="Parker", @email="jhopenh1@jumpstartlab.com", @home_phone="718-305-4000", @street="7123 Penn Avenue, #3", @city="Pittsburgh", @state="PA", @zipcode="15208">, #<Attendees:0x007fc90a9e6620 @date="2/1/09 17:05", @first_name="Patrick", @last_name="Parker", @email="qkika_farrell@jumpstartlab.com", @home_phone="718-305-4000", @street="4509 Frankford Avenue", @city="Philadelphia", @state="PA", @zipcode="19214">, #<Attendees:0x007fc90a9e65d0 @date="2/1/09 20:53", @first_name="Scott", @last_name="Parker", @email="qhuer321@jumpstartlab.com", @home_phone="202-270-1000", @street="19308 Alderbarn Ct", @city="Brookeville", @state="MD", @zipcode="20833">]

    assert_equal 3, new_queue.size?  # => true
    refute new_queue.empty?          # => false

    new_queue.clear  # => []

    assert_equal 0, new_queue.size?  # => true
  end

end

# >> Run options: --seed 23682
# >>
# >> # Running:
# >>
# >> [31m*[0m[32m*[0m[33m*[0m
# >>
# >> [31mF[0m[32ma[0m[33mb[0m[34mu[0m[35ml[0m[36mo[0m[31mu[0m[32ms[0m[33m [0m[34mr[0m[35mu[0m[36mn[0m in 0.001570s, 1910.8280 runs/s, 5095.5414 assertions/s.
# >>
# >> 3 runs, 8 assertions, 0 failures, 0 errors, 0 skips
