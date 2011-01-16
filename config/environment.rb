# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Blast::Application.initialize!

CONFIG = YAML.load_file("#{RAILS_ROOT}/config/config.yml")
