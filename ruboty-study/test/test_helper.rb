$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "ruboty/study"

require "minitest/autorun"
require 'minitest/reporters'
require "mocha/minitest"

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

