module GeradorCodigo
  extend ActiveSupport::Concern

  included do
    before_create :gerar_codigo
  end

  protected

  def gerar_codigo
    self.codigo = SecureRandom.hex(10)
  end
end
