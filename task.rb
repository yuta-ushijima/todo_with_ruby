require 'date'

class Task

  attr_accessor :name, :contents, :priority, :deadline, :created_at

  def initialize(name, contents, priority, deadline)
    @name = name
    @contents = contents
    @priority = priority
    @deadline = deadline
    @created_at = DateTime.now
  end

end
