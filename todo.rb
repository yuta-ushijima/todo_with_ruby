require 'date'
require 'active_support/all'
require "thor"
require "pry"
require_relative './task'
require_relative './concern/message_dialog'

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
      puts "【一覧】"
      @task_list.map.with_index(1) do |task, index|
        message_dialog_of_task_list(task, index)
      end
    end
  end

  def show
    message_dialog_of_task_number_for_detail
    # TODO: いい感じの書き方がないか？
    task_id = gets.chomp.to_i - DECREMENT_NUMBER
    task = @task_list[task_id]
    task.blank? ? empty_task_message : message_dialog_of_task_detail(task)
  end

  def create
    message_dialog_of_create_task_menu
    @task_list << Task.new(@name, @contents, @priority, @deadline)
  end

  def update
    message_dialog_of_task_number_for_update
    selected_num = gets.chomp.to_i
    index_num = selected_num - DECREMENT_NUMBER
    message_dialog_of_update_task
    @task_list[index_num] = Task.new(@name, @contents, @priority, @deadline)
  end

  def delete
    message_dialog_of_task_number_for_delete
    selected_num = gets.chomp.to_i
    index_num = selected_num - DECREMENT_NUMBER
    task = @task_list[index_num]
    message_dialog_of_delete_task(task)
    message_dialog_of_command_for_delete(index_num)
  end

end
