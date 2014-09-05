require 'spec_helper'


describe PacientesController do
  before do
    @organizacao = create(:organizacao)
    @organizacao2 = create(:organizacao_2)
    @usuario = create(:usuario, organizacao_id: @organizacao.id)
    #@usuario2 = create(:usuario2, organizacao_id = @organizacao.id)
    sign_in(@usuario)
  end
  
  describe "Consulta" do
    it "listar apenas pacientes da organizacao" do
      paciente = create(:paciente, organizacao_id: @organizacao.id)
      paciente2 = create(:paciente_2, organizacao_id: @organizacao2.id)
      puts paciente.organizacao_id
      puts paciente2.organizacao_id
      xhr :get, :listar
      expect(assigns(:pacientes)).to match_array([paciente])
    end
  end
end