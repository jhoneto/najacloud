class CreateLogAtividades < ActiveRecord::Migration
  # using(:log)
  def change
    create_table :log_atividades do |t|
      t.integer       :organizacao_id, null: false
      t.string        :nome_usuario
      t.string        :navegador
      t.string        :ip
      t.string        :controle
      t.string        :acao
      t.timestamps
    end
  end
end
