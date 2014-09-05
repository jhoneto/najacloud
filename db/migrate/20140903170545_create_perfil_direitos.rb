class CreatePerfilDireitos < ActiveRecord::Migration
  def change
    create_table :perfil_direitos do |t|
      t.integer      :organizacao_id, null: false
      t.integer      :perfil_id, null: false
      t.integer      :direito_id, null: false
      t.timestamps
    end
  end
end
