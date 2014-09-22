class AdicionarUnidadePerfilDireitos < ActiveRecord::Migration
  def change
    add_column :perfil_direitos, :unidade_id, :integer, null: true
  end
end
