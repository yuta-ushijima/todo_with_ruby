require 'date'
require 'active_support/all'
require "thor"
require "pry"

class Todo
  attr_accessor :tasks

  DECREMENT_NUMBER = 1

  def initialize
    @tasks = []
    @name = ''
    @contents = ''
    @priority = 0
    @deadline = Date.new(2019, 06, 02)
    @created_at = Date.today
  end

  def index
    if @tasks.empty?
      puts <<~TEXT

      登録されているタスクはありません

      TEXT
    else
      puts <<~TEXT

      【一覧】
      TEXT
      @tasks.each.with_index(1) do |task, i|
        puts <<~TEXT
        No.#{i}
        タスク名：#{task.name}
        優先順位：#{task.priority}
        期限：#{task.deadline}

        TEXT
      end
    end
  end

  def show
    puts "詳細表示するタスクを選んでください"
    print "タスクNo."

    # TODO: いい感じの書き方がないか？
    task_num = gets.chomp.to_i - DECREMENT_NUMBER

    task = @tasks[task_num]

    puts <<~TEXT

    【詳細】
    タスク名：#{task.name}
    内容：#{task.contents}
    優先順位：#{task.priority}
    期限：#{task.deadline}
    作成日：#{task.created_at}

    TEXT
  end

  def create
    puts "タスクを登録してください"
    print "名前："
    @name = gets.chomp
    print "内容："
    @contents = gets.chomp
    print "優先度（1~5）："
    @priority = gets.chomp

    year = Date.today.year.to_i
    print "期限（月）："
    month = gets.chomp.to_i
    print "期限（日）："
    day = gets.chomp.to_i
    @deadline = Date.new(year, month, day)

    @created_at = Date.today

    @tasks << Task.new(@name, @contents, @priority, @deadline, @created_at)

  end

  def update
    puts "どのタスクを更新しますか？"
    print "タスクNo."
    selected_num = gets.chomp.to_i
    index_num = selected_num - 1

    puts "タスクを登録してください"

    print "名前："
    @name = gets.chomp

    print "内容："
    @contents = gets.chomp

    print "優先度（1~5）："
    @priority = gets.chomp

    year = Date.today.year.to_i
    print "期限（月）："
    month = gets.chomp.to_i
    print "期限（日）："
    day = gets.chomp.to_i
    @deadline = Date.new(year, month, day)

    @created_at = Date.today

    @tasks[index_num] = Task.new(@id, @name, @contents, @priority, @deadline , @created_at)
  end

  def delete
    puts "削除するタスクNoを選んでください"
    print "タスクNo."
    selected_num = gets.chomp.to_i
    index_num = selected_num - 1
    task = @tasks[index_num]

    puts <<~TEXT

    以下のタスクを削除しますか？

    タスク名：#{task.name}
    内容：#{task.contents}
    優先順位：#{task.priority}
    期限：#{task.deadline}
    作成日：#{task.created_at}

    はい => y
    いいえ => n

    TEXT


    loop do
      print "入力："
      command = gets.chomp
      if command == 'y'
        @tasks.delete_at(index_num)
        puts <<~TEXT

        削除しました。

        TEXT

        break
      elsif command == 'n'
        puts <<~TEXT

        削除をキャンセルしました。

        TEXT

        break
      else
        puts <<~TEXT

        無効なコマンドです。
        もう一度、入力をお願いします。

        はい => y
        いいえ => n

        TEXT
      end
    end


  end

end

class Task

  attr_accessor :name, :contents, :priority, :deadline, :created_at

  def initialize(name, contents, priority, deadline, created_at)
    self.name = name
    self.contents = contents
    self.priority = priority
    self.deadline = deadline
    self.created_at = created_at
  end

end

@todo = Todo.new

loop do
  puts <<~TEXT

  【タスク管理】
  一覧 => 1
  詳細 => 2
  登録 => 3
  更新 => 4
  削除 => 5
  TEXT

  print "コマンド："
  selected_num = gets.chomp.to_i

  case selected_num
  when 1
    @todo.index
  when 2
    @todo.show
  when 3
    @todo.create
  when 4
    @todo.update
  when 5
    @todo.delete
  end
end
