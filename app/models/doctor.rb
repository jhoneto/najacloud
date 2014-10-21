class Doctor < ActiveRecord::Base
  validates :name, presence: true

  scope :by_name, -> name { where("name LIKE '%#{name}%'") }
end
