require './logger.rb'
require './todo.rb'

class Main
  extend Loggable

  @todo = Todo.new
  INDEX = 1
  SHOW = 2
  CREATE = 3
  UPDATE = 4
  DELETE = 5
  FINISH = 6

  loop do
    todo_menu_log

    selected_num = gets.chomp.to_i

    case selected_num
      when INDEX
        @todo.index
      when SHOW
        @todo.show
      when CREATE
        @todo.create
      when UPDATE
        @todo.update
      when DELETE
        @todo.delete
      when FINISH
        break
    end
  end

end
