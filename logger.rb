module Loggable
  private

  def todo_menu_log
    puts <<~TEXT.freeze
      【タスク管理】
        一覧 => 1
        詳細 => 2
        登録 => 3
        更新 => 4
        削除 => 5
        終了 => 6
    TEXT
    print "コマンド："

  end

  def index_log(task, i)
    puts "【一覧】"
    puts <<~TEXT.freeze
        No.#{i}
        タスク名：#{task.name}
        優先順位：#{task.priority}
        期限：#{task.deadline}
    TEXT
  end

  def index_empty_log
    puts "登録されているタスクはありません"
  end

  def show_menu_log
    puts "詳細表示するタスクを選んでください"
    print "タスクNo."
  end

  def show_log(task)
    puts <<~TEXT.freeze
      【詳細】
        タスク名：#{task.name}
        内容：#{task.contents}
        優先順位：#{task.priority}
        期限：#{task.deadline}
        作成日：#{task.created_at}
    TEXT
  end

  def create_log
    puts  "タスクを登録してください"
    print "名前："
    @name = gets.chomp

    print "内容："
    @contents = gets.chomp

    print "優先度（1~5）："
    @priority = gets.chomp

    print "期限(YYYY/MM//DD)："
    @deadline = gets.chomp
  end

  def update_menu_log
    puts "更新するタスクを選んでください"
    print "タスクNo."
  end

  def update_log
    puts  "タスクを更新してください"
    print "名前："
    @name = gets.chomp

    print "内容："
    @contents = gets.chomp

    print "優先度（1~5）："
    @priority = gets.chomp

    print "期限(YYYY/MM//DD)："
    @deadline = gets.chomp
  end

  def delete_menu_log
    puts "削除するタスクを選んでください"
    print "タスクNo."
  end

  def delete_log(task)
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
  end

  # TODO: viewにロジックがあるので分離する
  def delete_dialog(index_num)
    loop do
      print "入力："
      command = gets.chomp
      if command == 'y'
        @task_list.delete_at(index_num)
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
