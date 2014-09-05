class CreateUsuarioPerfis < ActiveRecord::Migration
  def change
    create_table :usuario_perfis do |t|
      t.integer      :organizacao_id, null: false
      t.integer      :usuario_id, null: false
      t.integer      :perfil_id, null: false
      t.timestamps
    end
  end
end
