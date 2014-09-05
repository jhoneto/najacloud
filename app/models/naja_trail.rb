class NajaTrail < PaperTrail::Version
  include Octopus::Model
  octopus_establish_connection(SHARDS['log'])
  
  self.table_name = :versions
end