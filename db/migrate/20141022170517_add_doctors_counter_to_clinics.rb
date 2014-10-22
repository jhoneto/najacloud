class AddDoctorsCounterToClinics < ActiveRecord::Migration
  def change
    add_column :clinics, :doctors_count, :integer
  end
end
