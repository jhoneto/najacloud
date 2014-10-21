# Usuarios
class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         request_keys: [:subdomain]

  attr_accessor :unidade_id
  has_many :usuario_perfis, class_name: 'UsuarioPerfil', foreign_key: 'usuario_id'



  def self.find_for_authentication(warden_conditions)
    org = Organizacao.where('sub_dominio = ?', warden_conditions[:subdomain]).first
    org_id = org.nil? ? 0 : org.id
    where(username: warden_conditions[:username], organizacao_id: org_id).first
  end



  def acesso_liberado?(classe, unidade, funcao)
    Direito.tem_acesso?(id, unidade, classe, funcao)
  end

end
