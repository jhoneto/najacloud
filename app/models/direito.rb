class Direito < ActiveRecord::Base
  
  has_many :perfil_direitos, :class_name => 'PerfilDireito', :foreign_key => 'direito_id'
  has_many :perfis, :class_name => 'Perfil', through: :perfil_direitos
  
  def self.tem_acesso?(usuario_id, unidade_id, classe, funcao)
    Direito.joins(:perfis).joins('inner join usuario_perfis  on usuario_perfis.perfil_id = usuario_perfis.perfil_id').where('classe = ?  and funcao = ? and usuario_perfis.usuario_id = ? and (perfil_direitos.unidade_id is null or perfil_direitos.unidade_id = ?)', classe, funcao, usuario_id, unidade_id).count > 0
  end
  
  
end
