require 'date'
require 'active_support/all'

class Todo
  attr_accessor :tasks

  def initialize
    @tasks = []
    @id = 0
  end

  def index
    @tasks.each do |task|
      puts <<~TEXT

      【詳細】
      No.#{task.id}
      タスク名：#{task.name}
      優先順位：#{task.priority}
      期限：#{task.limit}

      TEXT
    end
  end

  def show
    puts "詳細表示するタスクを選んでください"
    print "タスクNo"
    task_num = gets.chomp.to_i - 1

    task = @tasks[task_num]


    puts <<~TEXT

    【詳細】
    タスク名：#{task.name}
    内容：#{task.contents}
    優先順位：#{task.priority}
    期限：#{task.limit}
    作成日：#{task.created_at}

    TEXT
  end

  def create
    @id += 1

    puts "タスクを登録してください"
    print "名前："
    name = gets.chomp
    print "内容："
    contents = gets.chomp
    print "優先度（1~5）："
    priority = gets.chomp

    year = Date.today.year.to_i
    print "期限（月）："
    month = gets.chomp.to_i
    print "期限（日）："
    day = gets.chomp.to_i

    @tasks << Task.new(@id, name, contents, priority, Date.new(year, month, day), Date.today)

  end

  def update
  end

  def delete
  end

end

class Task

  attr_accessor :id, :name, :contents, :priority, :limit, :created_at

  def initialize(id, name, contents, priority, limit, created_at)
    self.id = id
    self.name = name
    self.contents = contents
    self.priority = priority
    self.limit = limit
    self.created_at = created_at
  end

end

todo = Todo.new

todo.create
todo.index
todo.show
