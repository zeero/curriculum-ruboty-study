require 'ruboty/study'

module Ruboty
  module Study
    module Actions
      class Hello < Ruboty::Actions::Base
        def call
          message.reply('TODO: write a message.')
        end
      end
    end
  end
end
