class CreateDireitos < ActiveRecord::Migration
  def change
    create_table :direitos do |t|
      t.string      :classe, null: false
      t.string      :funcao, null: false
      t.string      :descricao, null: false
      t.string      :chave
      t.timestamps
    end
  end
end
