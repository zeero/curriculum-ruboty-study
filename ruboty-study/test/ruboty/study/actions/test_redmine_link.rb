require 'test_helper'

describe Ruboty::Study::Actions::RedmineLink do
  subject { Ruboty::Study::Actions::RedmineLink.new(mock_message) }

  let(:robot) { Ruboty::Robot.new }
  let(:mock_message) {
    mock.tap { |mock|
      mock.stubs(:robot).returns(robot)
    }
  }

  SLACK_USER_NAME = '@foo'
  REDMINE_USER_ID = '1'

  before do
  end

  after do
  end

  describe '#call' do
    it 'リンク登録ができる' do
      # テスト準備：スタブでmessageに<slack_user_name>と<redmine_user_id>を設定
      mock_message.stubs(:[]).with(:slack_user_name).returns(SLACK_USER_NAME)
      mock_message.stubs(:[]).with(:redmine_user_id).returns(REDMINE_USER_ID)

      # テスト検証：モックでreplyの引数を検証
      mock_message.expects(:reply).with("Redmine User ID: #{REDMINE_USER_ID} を #{SLACK_USER_NAME} にリンクしました").once

      # テスト実行
      subject.call

      # テスト検証：Brainを検証
      actual = mock_message.robot.brain.data[Ruboty::Study::BRAIN_KEY_REDMINE_LINKS]
      expected = { SLACK_USER_NAME => REDMINE_USER_ID }
      expect(actual).must_equal expected
    end

    it '複数件のリンク登録ができる' do
      # テスト準備：スタブでmessageに<slack_user_name>と<redmine_user_id>を設定
      mock_message.stubs(:[]).with(:slack_user_name).returns(SLACK_USER_NAME)
      mock_message.stubs(:[]).with(:redmine_user_id).returns(REDMINE_USER_ID)
    
      # テスト準備：brainにデータを設定
      initial_data = { '@bar' => '2' }
      mock_message.robot.brain.data[Ruboty::Study::BRAIN_KEY_REDMINE_LINKS] = initial_data
    
      # テスト検証：モックでreplyの引数を検証
      mock_message.expects(:reply).with("Redmine User ID: #{REDMINE_USER_ID} を #{SLACK_USER_NAME} にリンクしました").once
    
      # テスト実行
      subject.call

      # テスト検証：Brainを検証
      actual = mock_message.robot.brain.data[Ruboty::Study::BRAIN_KEY_REDMINE_LINKS]
      expected = { SLACK_USER_NAME => REDMINE_USER_ID }.merge(initial_data)
      expect(actual).must_equal expected
    end
  end
end

