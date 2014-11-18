class Queue
  attr_reader :queue

  def initialize
    @queue = []
  end

  def empty?
    queue.empty?
  end

  def count
    queue.count
  end

  def clear
    @queue = []
  end
end
