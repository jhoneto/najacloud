class CreatePacientes < ActiveRecord::Migration
  def change
    create_table :pacientes do |t|
      t.string       :codigo
      t.string       :nome
      t.boolean      :ativo
      t.string       :sexo, limit: 1
      t.date         :data_nascimento
      t.integer      :organizacao_id
      t.timestamps
    end
  end
end
