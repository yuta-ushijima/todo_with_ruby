require_relative './concern/message_dialog'
require_relative './todo.rb'

class Main
  extend MessageDialog

  @todo = Todo.new

  INDEX = 1
  SHOW = 2
  CREATE = 3
  UPDATE = 4
  DELETE = 5
  FINISH = 6

  loop do
    message_dialog_of_management_menu

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
