class CreateDoctores < ActiveRecord::Migration
  def change
    create_table :doctores do |t|
      t.string :name
      t.date :birthdate
      t.string :phone

      t.timestamps
    end
  end
end
