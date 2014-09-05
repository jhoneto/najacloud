class CreateUsuarioUnidades < ActiveRecord::Migration
  def change
    create_table :usuario_unidades do |t|
      t.integer       :organizacao_id, null: false
      t.integer       :usuario_id, null: false
      t.integer       :unidade_id, null: false
      t.timestamps
    end
  end
end
