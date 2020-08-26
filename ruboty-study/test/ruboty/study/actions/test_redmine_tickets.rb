require 'test_helper'

require 'json'
require 'active_resource/http_mock'

describe Ruboty::Study::Actions::RedmineTickets do
  subject { Ruboty::Study::Actions::RedmineTickets.new(mock_message) }

  let(:mock_message) { mock }

  USER_ID = '1'
  HEADERS = {
    'Accept' => 'application/xml',
    'X-Redmine-API-Key' => 'dummy'
  }
  ISSUE_ID10 = JSON.parse(File.open('test/fixtures/issue_id10.json').read)
  ISSUE_ID20 = JSON.parse(File.open('test/fixtures/issue_id20.json').read)

  before do
  end

  after do
    ActiveResource::HttpMock.reset!
  end

  describe '#call' do
    it '担当チケット一覧（チケット１つ）を返す' do
      # テスト準備：HttpMockでネットワーク通信を偽装
      ActiveResource::HttpMock.respond_to do |http|
        http.get "/issues.xml?assigned_to_id=#{USER_ID}", HEADERS, [ISSUE_ID10].to_xml(root: 'issues')
      end

      # テスト準備：スタブでmessageに<user>を設定
      mock_message.stubs(:[]).with(:user).returns(USER_ID)

      # テスト検証：モックでreplyの引数を検証
      mock_message.expects(:reply).with("User ID: #{USER_ID} の担当チケット一覧\n```\n#10: チケットタイトル\n```")

      # テスト実行
      subject.call
    end

    it '担当チケット一覧（チケット複数）を返す' do
      # テスト準備：HttpMockでネットワーク通信を偽装
      ActiveResource::HttpMock.respond_to do |http|
        http.get "/issues.xml?assigned_to_id=#{USER_ID}", HEADERS, [ISSUE_ID10, ISSUE_ID20].to_xml(root: 'issues')
      end

      # テスト準備：スタブでmessageに<user>を設定
      mock_message.stubs(:[]).with(:user).returns(USER_ID)

      # テスト検証：モックでreplyの引数を検証
      mock_message.expects(:reply).with("User ID: #{USER_ID} の担当チケット一覧\n```\n#10: チケットタイトル\n#20: ２つ目のチケット\n```")

      # テスト実行
      subject.call
    end

    it '担当チケット一覧（チケットなし）を返す' do
      # テスト準備：HttpMockでネットワーク通信を偽装
      ActiveResource::HttpMock.respond_to do |http|
        http.get "/issues.xml?assigned_to_id=#{USER_ID}", HEADERS
      end

      # テスト準備：スタブでmessageに<user>を設定
      mock_message.stubs(:[]).with(:user).returns(USER_ID)

      # テスト検証：モックでreplyの引数を検証
      mock_message.expects(:reply).with("User ID: #{USER_ID} の担当チケット一覧\n```\n\n```")

      # テスト実行
      subject.call
    end
  end
end

