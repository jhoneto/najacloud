class CreateOrganizacoes < ActiveRecord::Migration
  # using(:admin)
  def change
    create_table :organizacoes do |t|
      t.string        :nome, null: false
      t.string        :sub_dominio, null: false
      t.timestamps
    end
  end
end
