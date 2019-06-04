require 'date'
require 'active_support/all'
require "thor"
require "pry"
require 'task'
require 'concern/message_dialog'

class Todo
  include MessageDialog

  attr_accessor :tasks

  DECREMENT_NUMBER = 1

  def initialize
    @task_list = []
  end

  def index
    if @task_list.empty?
      empty_task_message
    else
      @task_list.map.with_index(1) do |task, i|
        display_task_list(task, i)
      end
    end
  end

  def show
    show_menu_log
    # TODO: いい感じの書き方がないか？
    task_id = gets.chomp.to_i - DECREMENT_NUMBER
    task = @task_list[task_id]
    show_log(task)
  end

  def create
    create_log
    @task_list << Task.new(@name, @contents, @priority, @deadline)
  end

  def update
    update_menu_log
    selected_num = gets.chomp.to_i
    index_num = selected_num - DECREMENT_NUMBER
    update_log
    @task_list[index_num] = Task.new(@name, @contents, @priority, @deadline)
  end

  def delete
    delete_menu_log
    selected_num = gets.chomp.to_i
    index_num = selected_num - DECREMENT_NUMBER
    task = @task_list[index_num]
    delete_log(task)
    delete_dialog(index_num)
  end

end
