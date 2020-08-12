require 'ruboty/study'

module Ruboty
  module Handlers
    class Study < Base
      on(/study hello/, name: 'hello', description: 'TODO: write your description')

      def hello(message)
        Ruboty::Study::Actions::Hello.new(message).call
      end
    end
  end
end
