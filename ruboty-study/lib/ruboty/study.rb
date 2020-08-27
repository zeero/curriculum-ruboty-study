require "ruboty"

module Ruboty
  module Study
    BRAIN_KEY_REDMINE_LINKS = 'redmine_links'
  end
end

Dir[File.expand_path('study', __dir__) << '/**/*.rb'].each { |file| require file }
Dir[File.expand_path('handlers', __dir__) << '/**/*.rb'].each { |file| require file }

