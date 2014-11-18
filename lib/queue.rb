class Queue
  attr_reader :queue

  def initialize
    @queue = []
  end

  def empty?
    queue.empty?
  end

  def size?
    queue.count
  end

  def clear
    @queue = []
  end
end
