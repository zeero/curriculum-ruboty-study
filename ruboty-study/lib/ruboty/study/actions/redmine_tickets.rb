require 'ruboty/study'

module Ruboty
  module Study
    module Actions
      class RedmineTickets < Ruboty::Actions::Base
        def call
          user_id = message[:user]

          # Redmineから特定ユーザのチケット一覧を取得
          condition = { assigned_to_id: user_id }
          issues = ActiveResources::Redmine::Issue.where(condition)
          return message.reply("User ID: #{user_id} の担当チケットはありません") if issues.empty?

          # 返信
          message.reply(format(user_id, issues))
        end

        private

        def format(user_id, issues)
          lines = []
          lines << "User ID: #{user_id} の担当チケット一覧"
          lines << "```"
          lines << issues.map { |issue| "##{issue.id}: #{issue.subject}" }
          lines << "```"
          lines.join("\n")
        end
      end
    end
  end
end

