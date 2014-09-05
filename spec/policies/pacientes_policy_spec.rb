require 'spec_helper'

describe PacientePolicy do
  subject { PacientePolicy }
  
  
  permissions :update?, :edit?, :new?, :create?, :index?, :listar? do
    it "usuario sem acesso" do
      expect(subject).not_to permit(@usuario_sem_acesso, Paciente.new)
    end
    
    it "usuario com acesso" do
      expect(subject).to permit(@usuario, Paciente.new)
    end
  end
end