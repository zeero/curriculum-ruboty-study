require 'ruboty/study'

module Ruboty
  module Handlers
    class Study < Base
      on(/(?<hello>hello|こんにちは|hola|bonjour)/, name: 'hello', description: 'helloと言ったら、world!を返す（英日西仏対応版）')

      on(/redmine +tickets +(?<user>[0-9]+)/, name: 'redmine_tickets', description: 'Redmineの担当チケット一覧を返す')

      on(/redmine +link +(?<slack_user_name>@\S+) +(?<redmine_user_id>[0-9]+)/i, name: 'redmine_link', description: 'Slackユーザ名とRedmineユーザIDをリンクする')

      def hello(message)
        Ruboty::Study::Actions::Hello.new(message).call
      end

      def redmine_tickets(message)
        Ruboty::Study::Actions::RedmineTickets.new(message).call
      end

      def redmine_link(message)
        Ruboty::Study::Actions::RedmineLink.new(message).call
      end
    end
  end
end
