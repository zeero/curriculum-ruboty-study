module Ruboty
  module Handlers
    class Study < Base
      on(/hello/, name: 'hello', description: 'helloと言ったら、world!を返す')

      def hello(message)
        Ruboty::Study::Actions::Hello.new(message).call
      end
    end
  end
end
