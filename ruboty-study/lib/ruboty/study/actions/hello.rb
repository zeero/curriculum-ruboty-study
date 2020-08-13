require 'ruboty/study'

module Ruboty
  module Study
    module Actions
      class Hello < Ruboty::Actions::Base
        def call
          message.reply('world!')
        end
      end
    end
  end
end
