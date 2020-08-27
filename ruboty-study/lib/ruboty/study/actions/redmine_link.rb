require 'ruboty/study'

module Ruboty
  module Study
    module Actions
      class RedmineLink < Ruboty::Actions::Base
        def call
          slack_user_name = message[:slack_user_name]
          redmine_user_id = message[:redmine_user_id]

          # Slackユーザ名からRedmineユーザIDを取得
          links = message.robot.brain.data[BRAIN_KEY_REDMINE_LINKS] || {}
          links[slack_user_name] = redmine_user_id
          message.robot.brain.data[BRAIN_KEY_REDMINE_LINKS] = links

          # 返信
          message.reply("Redmine User ID: #{redmine_user_id} を #{slack_user_name} にリンクしました")
        end
      end
    end
  end
end


