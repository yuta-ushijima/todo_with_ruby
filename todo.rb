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
      empty_task_list_message
    else
      puts "【一覧】"
      @task_list.map.with_index(1) do |task, index|
        display_task_list(task, index)
      end
    end
  end

  def show
    display__message_of_task_detail
    # TODO: いい感じの書き方がないか？
    task_id = gets.chomp.to_i - DECREMENT_NUMBER
    task = @task_list[task_id]
    display_task_detail(task)
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
