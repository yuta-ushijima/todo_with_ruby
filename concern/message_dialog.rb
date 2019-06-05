module MessageDialog

  private

  def message_dialog_of_management_menu
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

  def message_dialog_of_task_list(task, index)
    puts <<~TEXT.freeze
      No.#{index}
      タスク名：#{task.name}
      優先順位：#{task.priority}
      期限：#{task.deadline}
    TEXT
  end

  def empty_task_message
    puts "登録されているタスクはありません"
  end

  def message_dialog_of_task_number_for_detail
    puts "詳細表示するタスクを選んでください"
    print "タスクNo."
  end

  def message_dialog_of_task_detail(task)
    puts <<~TEXT.freeze
      【詳細】
        タスク名：#{task.name}
        内容：#{task.contents}
        優先度：#{task.priority}
        期限：#{task.deadline}
        作成日：#{task.created_at}
    TEXT
  end

  def message_dialog_of_create_task_menu
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

  def message_dialog_of_task_number_for_update
    puts "更新するタスクを選んでください"
    print "タスクNo."
  end

  def message_dialog_of_update_task
    puts  "タスクを更新してください"
    print "タスク名："
    @name = gets.chomp

    print "内容："
    @contents = gets.chomp

    print "優先度（1~5）："
    @priority = gets.chomp

    print "期限(YYYY/MM//DD)："
    @deadline = gets.chomp
  end

  def message_dialog_of_task_number_for_delete
    puts "削除するタスクを選んでください"
    print "タスクNo."
  end

  def message_dialog_of_delete_task(task)
    puts <<~TEXT

      以下のタスクを削除しますか？

      タスク名：#{task.name}
      内容：#{task.contents}
      優先度：#{task.priority}
      期限：#{task.deadline}
      作成日：#{task.created_at}

      はい => y
      いいえ => n

    TEXT
  end

  # TODO: viewにロジックがあるので分離する
  def message_dialog_of_command_for_delete(index_num)
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
