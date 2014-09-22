class LogAtividade < ActiveRecord::Base
  include Octopus::Model
  octopus_establish_connection(SHARDS['log'])
  def self.registrar(organizacao_id, nome_usuario, navegador, ip, controle, acao)
    LogAtividade.create(organizacao_id: organizacao_id,
                        nome_usuario: nome_usuario,
                        navegador: navegador,
                        ip: ip,
                        controle: controle,
                        acao: acao)
  end
end
