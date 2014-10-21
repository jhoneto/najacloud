class CreateDoctores < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :name
      t.date :birthdate
      t.string :phone

      t.timestamps
    end
  end
end
