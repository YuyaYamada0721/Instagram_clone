require_relative 'boot'
require 'rails/all'
Bundler.require(*Rails.groups)
module RailsExamClone3
  class Application < Rails::Application
    config.load_defaults 5.2
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    config.generators do |g|
      g.assets false
      g.helper false
      g.jbuilder false
    end
  end
end
