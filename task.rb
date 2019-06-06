require 'date'

class Task

  attr_accessor :name, :contents, :priority, :deadline, :created_at

  def initialize(task_params)
    @name = task_params[:name]
    @contents = task_params[:contents]
    @priority = task_params[:priority]
    @deadline = task_params[:deadline]
    @created_at = DateTime.now
  end
end
