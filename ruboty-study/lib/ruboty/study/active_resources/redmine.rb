require 'active_resource'

module Ruboty
  module Study
    module ActiveResources
      module Redmine
        class Base < ActiveResource::Base
          self.site = ENV['REDMINE_URL']
          self.headers['X-Redmine-API-Key'] = ENV['REDMINE_API_KEY']
          self.format = :xml

          ActiveSupport::Notifications.subscribe('request.active_resource') do |name, start, finish, id, payload|
            p payload if $DEBUG
          end
        end

        class Issue < Base
          self.prefix = '/'
        end
      end
    end
  end
end

