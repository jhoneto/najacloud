class AddClinicIdToDoctors < ActiveRecord::Migration
  def change
    add_column :doctors, :clinic_id, :integer
    add_index :doctors, :clinic_id
  end
end
