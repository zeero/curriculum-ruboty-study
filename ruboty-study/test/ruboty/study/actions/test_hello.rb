require 'test_helper'

describe Ruboty::Study::Actions::Hello do
  subject { Ruboty::Study::Actions::Hello.new(mock_message) }

  let(:mock_message) { mock }

  describe '#hello_world()' do
    it '引数が"hello"の場合、"world"を返す' do
      actual = subject.send(:hello_world, 'hello')
      expected = 'world'
      expect(actual).must_equal expected
    end

    it '引数が"こんにちは"の場合、"世界"を返す' do
      actual = subject.send(:hello_world, 'こんにちは')
      expected = '世界'
      expect(actual).must_equal expected
    end

    it '引数が"hola"の場合、"Mundo"を返す' do
      actual = subject.send(:hello_world, 'hola')
      expected = 'Mundo'
      expect(actual).must_equal expected
    end

    it '引数が"bonjour"の場合、"le monde"を返す' do
      actual = subject.send(:hello_world, 'bonjour')
      expected = 'le monde'
      expect(actual).must_equal expected
    end
  end

  describe '#call()' do
    it 'message[:hello]が"こんにちは"の場合、"世界!"を返信する' do
      # テスト準備：スタブでmessageに[:hello]を設定
      mock_message.stubs(:[]).with(:hello).returns('こんにちは')

      # スタブの動作確認
      expect(mock_message[:hello]).must_equal 'こんにちは'

      # テスト検証：モックでreplyの引数を検証
      mock_message.expects(:reply).with('世界!').returns.once

      # テスト実行
      subject.call
    end
  end
end

