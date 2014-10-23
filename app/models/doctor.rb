class Doctor < ActiveRecord::Base
  validates :name, presence: true
  validates :clinic_id, presence: true

  belongs_to :clinic, counter_cache: true

  scope :by_name, -> name { where("name LIKE '%#{name}%'") }
end
