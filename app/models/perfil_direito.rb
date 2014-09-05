class PerfilDireito < ActiveRecord::Base
  belongs_to :perfil, :class_name => "Perfil", :foreign_key => "perfil_id"
  belongs_to :direito, :class_name => "Direito", :foreign_key => "direito_id"
end
