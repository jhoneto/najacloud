class CreateUnidades < ActiveRecord::Migration
  def change
    create_table :unidades do |t|
      t.integer        :organizacao_id, null: false
      t.string         :nome, null: false
      t.timestamps
    end
  end
end
