class Clinic < ActiveRecord::Base
  has_many :doctors

  def doctors_names
    doctors.pluck(:name)
  end
end
