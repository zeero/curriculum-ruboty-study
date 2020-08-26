require 'test_helper'

describe Ruboty::Handlers::Study do
  let(:robot) { Ruboty::Robot.new }
  # Actionのモック
  let(:mock_action) { mock.tap { |mock|
    # テスト検証： `Ruboty::Study::Actions::Hello#call()` メソッドが呼び出されること
    mock.expects(:call)
  } }

  describe '#hello()' do
    it '"hello"に反応する' do
      # テスト検証： `Ruboty::Study::Actions::Hello.new()` メソッドが呼び出されること
      Ruboty::Study::Actions::Hello
        .expects(:new)
        .with { |message|
          # テスト検証： Actionに渡す `message` が正しく設定されていること
          expect(message[:hello]).must_equal 'hello'
        }
        .returns(mock_action)

      # テスト実行
      robot.receive(body: 'ruboty hello', from: 'sender', to: 'channel')
    end

    it '"こんばんは"に反応しない' do
      # テスト検証：Action.newをmock化して、呼ばれないことを検証
      Ruboty::Study::Actions::Hello
        .expects(:new)
        .never

      # テスト実行
      robot.receive(body: 'ruboty こんばんは', from: 'sender', to: 'channel')
    end
  end

  describe '#redmine_tickets' do
    it '"redmine tickets 1"に反応する' do
      # テスト検証：Action.newの引数のmessageを取り出して、正規表現のマッチが正しいかを検証する
      Ruboty::Study::Actions::RedmineTickets
        .stubs(:new)
        .with { |message|
          expect(message[:user]).must_equal '1'
        }
        .returns(mock_action)

      # テスト実行
      robot.receive(body: 'ruboty redmine tickets 1', from: 'sender', to: 'channel')
    end

    it '"redmine tickets 22"に反応する' do
      # テスト検証：Action.newの引数のmessageを取り出して、正規表現のマッチが正しいかを検証する
      Ruboty::Study::Actions::RedmineTickets
        .stubs(:new)
        .with { |message|
          expect(message[:user]).must_equal '22'
        }
        .returns(mock_action)

      # テスト実行
      robot.receive(body: 'ruboty redmine tickets 22', from: 'sender', to: 'channel')
    end

    it '"redmine tickets a"に反応しない' do
      # テスト検証：Action.newをmock化して、呼ばれないことを検証
      Ruboty::Study::Actions::RedmineTickets
        .expects(:new)
        .never

      # テスト実行
      robot.receive(body: 'ruboty redmine tickets a', from: 'sender', to: 'channel')
    end
  end
end

