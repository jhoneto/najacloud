class AddDireitosCadastroPacientes < ActiveRecord::Migration
  def change
    Direito.create(funcao: "index", classe: "Paciente", descricao: "Acesso a lista de pacientes")
    Direito.create(funcao: "create", classe: "Paciente", descricao: "Acesso a cadastrar um novo paciente")
    Direito.create(funcao: "update", classe: "Paciente", descricao: "Acesso a editar um paciente")
    Direito.create(funcao: "destroy", classe: "Paciente", descricao: "Acesso a excluir um paciente")
  end
end
