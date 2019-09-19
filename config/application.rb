require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module News
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.assets.precompile << /\.(?:svg|eot|woff|ttf)\z/

    config.paths.add File.join('app', 'api'), glob: File.join('**', '*.rb')
    config.autoload_paths += Dir[Rails.root.join('app')]

    config.time_zone = 'Beijing'
    config.active_record.default_timezone = :local
    config.i18n.locale = 'zh-CN'
    config.i18n.default_locale = 'zh-CN'
    config.encoding = "utf-8"
    config.active_support.escape_html_entities_in_json = true
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
