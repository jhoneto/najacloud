class Perfil < ActiveRecord::Base
  has_many :perfil_direitos, :class_name => "PerfilDireito", :foreign_key => "perfil_id"
  has_many :direitos, :class_name => "Direito", through: :perfil_direitos
  has_many :usuario_perfis, :class_name => "UsuarioPerfil", :foreign_key => "perfil_id"
end
