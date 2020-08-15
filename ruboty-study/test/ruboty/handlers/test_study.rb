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
end

