class AddUnidadePadraoToUsuario < ActiveRecord::Migration
  def change
    add_column :usuarios, :unidade_id, :integer
  end
end