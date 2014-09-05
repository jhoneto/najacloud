class Organizacao < ActiveRecord::Base
  include Octopus::Model
  octopus_establish_connection(SHARDS['admin'])
end
