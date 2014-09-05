class PerfilDireito < ActiveRecord::Base
  belongs_to :perfil, :class_name => "Perfil", :foreign_key => "perfil_id"
  belongs_to :direito, :class_name => "Direito", :foreign_key => "direito_id"
  
  
  def self.associar(organizacao_id, direito_id, perfil_id)
    PerfilDireito.create(organizacao_id: organizacao_id, perfil_id: perfil_id, direito_id: direito_id)
  end
  
  def self.remover(organizacao_id, direito_id, perfil_id)
    p = PerfilDireito.where(organizacao_id: organizacao_id, perfil_id: perfil_id, direito_id: direito_id).first
    p.destroy
  end
  
end
