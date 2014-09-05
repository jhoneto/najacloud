class CreatePerfis < ActiveRecord::Migration
  def change
    create_table :perfis do |t|
      t.integer       :organizacao_id, null: false
      t.string        :nome, null: false
      t.timestamps
    end
  end
end
