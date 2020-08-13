require 'ruboty/study'

module Ruboty
  module Handlers
    class Study < Base
      on(/(?<hello>hello|こんにちは|hola|bonjour)/, name: 'hello', description: 'helloと言ったら、world!を返す（英日西仏対応版）')

      def hello(message)
        Ruboty::Study::Actions::Hello.new(message).call
      end
    end
  end
end
