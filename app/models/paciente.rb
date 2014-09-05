class Paciente < ActiveRecord::Base
  include GeradorCodigo
  include Trail

  scope :por_organizacao, lambda { |organizacao_id| where(organizacao_id: organizacao_id)}
  scope :por_nome, lambda { |nome| where("nome ilike ?", "%#{nome}%")}

  validates_presence_of :nome
end
