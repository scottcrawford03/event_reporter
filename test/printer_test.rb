require_relative '../test_helper'
require_relative '../lib/printer'

class PrinterTest < Minitest::Test

  def test_it_prints_intro_message
    printer = Printer.new
    assert_equal "Welcome to Event Reporter!\nType 'help' at any time for a list of commands", printer.intro_message
  end

  def test_it_prints_invalid_input
    printer = Printer.new
    assert_equal 'Your input is invalid. Please try again.', printer.invalid_input
  end

  def test_it_prints_loaded_success
    printer = Printer.new
    assert_equal 'Your file has been loaded successfully!', printer.loaded_success
  end

  def test_it_prints_entry_prompt
    printer = Printer.new
    assert_equal 'Enter Your Command > ', printer.entry_prompt
  end

  def test_it_prints_load_file_first
    printer = Printer.new
    assert_equal 'You must load a file first.', printer.load_file_first
  end

  def test_it_prints_quit_message
    printer = Printer.new
    assert_equal 'Goodbye!', printer.quit_message
  end

  def test_it_prints_after_search
    printer = Printer.new
    assert_equal 'Your search is done. Check the queue.', printer.after_search
  end

  def test_it_prints_queue_size
    printer = Printer.new
    new_queue = 3
    assert_equal "Your Queue has 3 item(s) in it.", printer.queue_size(new_queue)
  end

  def test_it_prints_after_search
    printer = Printer.new
    assert_equal 'The default file Event_Attendees.csv was loaded successfully!', printer.event_attendees_loaded
  end
end
