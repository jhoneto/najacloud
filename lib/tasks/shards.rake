require "octopus"

namespace :shard do

  desc "Create shards database"
  task :create do
    env_name = defined?(Rails.env) ? Rails.env : RAILS_ENV || 'development'
    yaml = YAML.load_file('config/shards.yml')['octopus']["#{env_name}"]
    yaml.each do |key, conf|
      if ActiveRecord::VERSION::MAJOR >= 4
        ActiveRecord::Tasks::DatabaseTasks.create(conf)
      else
        create_database(conf)
      end
    end
  end

  desc "Drop shards database"
  task :drop do
    env_name = defined?(Rails.env) ? Rails.env : RAILS_ENV || 'development'
    yaml = YAML.load_file('config/shards.yml')['octopus']["#{env_name}"]
    yaml.each do |key, conf|
      if ActiveRecord::VERSION::MAJOR >= 4
        ActiveRecord::Tasks::DatabaseTasks.drop(conf)
      else
        drop_database(conf)
      end
    end
  end

end
