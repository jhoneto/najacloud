class PacientesController < InheritedResources::Base
  has_scope :por_organizacao
  has_scope :por_nome
  actions :all, except: [:show]
  

  def index
    @pacientes = []
  end
  
  def listar
    collection
  end
  
  def update
    update! do |format|
      format.html { (params[:acao] == "salvar_e_novo") ? redirect_to(new_paciente_path) : redirect_to(pacientes_path) }
    end
  end

  def permitted_params
    params.permit(paciente: [:nome, :ativo, :sexo, :data_nascimento, :acao])
  end
end
