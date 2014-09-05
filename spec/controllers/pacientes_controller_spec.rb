require 'spec_helper'


describe PacientesController do
  before do
    sign_in(@usuario)
  end
  
  describe "Consulta" do
    it "listar apenas pacientes da organizacao" do
      paciente = create(:paciente, organizacao_id: @organizacao.id)
      paciente2 = create(:paciente_2, organizacao_id: @organizacao2.id)
      xhr :get, :listar
      expect(assigns(:pacientes)).to match_array([paciente])
    end
  end
end