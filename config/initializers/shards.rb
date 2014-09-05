env_name = defined?(Rails.env) ? Rails.env : RAILS_ENV || 'development'

SHARDS = YAML.load_file('config/shards.yml')['octopus']["#{env_name}"]
