require 'simplecov'
require 'coveralls'

SimpleCov.formatter = Coveralls::SimpleCov::Formatter
SimpleCov.start do
   add_filter 'app/channels/application_cable'
   'app/jobs'
   'app/controllers/api/v1/votes_controller.rb'
end
