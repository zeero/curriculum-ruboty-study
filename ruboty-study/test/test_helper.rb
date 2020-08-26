require 'simplecov'
SimpleCov.start do
  add_filter '/test/'
end

# ActiveResourceが初期化されるため、ruboty/study読み込み前に設定が必要
ENV['REDMINE_URL'] = 'http://ruboty.test'
ENV['REDMINE_API_KEY'] = 'dummy'

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "ruboty/study"

require "minitest/autorun"
require 'minitest/reporters'
require "mocha/minitest"

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

