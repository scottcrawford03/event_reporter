class Queue
  attr_reader :queue

  def initialize
    @queue = []
  end

  def add(result)
    result.each_index do |index|
      queue << result[index]
    end
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
