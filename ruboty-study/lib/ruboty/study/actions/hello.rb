module Ruboty
  module Study
    module Actions
      class Hello < Ruboty::Actions::Base
        def call
          hello = message[:hello]
          world = hello_world(hello)
          message.reply("#{world}!")
        end

        private

        def hello_world(source)
          case source
          when 'hello'
            'world'
          when 'こんにちは'
            '世界'
          when 'hola'
            'Mundo'
          when 'bonjour'
            'le monde'
          end
        end
      end
    end
  end
end
