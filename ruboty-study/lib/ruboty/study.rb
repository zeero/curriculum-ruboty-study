require "ruboty"

module Ruboty
  module Study
    # Your code goes here...
  end
end

Dir[File.expand_path('study', __dir__) << '/**/*.rb'].each { |file| require file }
Dir[File.expand_path('handlers', __dir__) << '/**/*.rb'].each { |file| require file }

