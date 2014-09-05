class NajacloudPolicy < ApplicationPolicy
  
  def index?
    liberado?('index')
  end
  
  def listar?
    index?
  end

  def show?
    false
  end

  def create?
    liberado?('create')
  end

  def update?
    liberado?('update')
  end

  def destroy?
    liberado?('destroy')
  end
  
  def liberado?(acao)
    #user.acesso_liberado?(obter_classe, acao)
    Direito.tem_acesso?(@user.id, obter_classe, acao)
  end
  
  def obter_classe
    klass = if @record.respond_to?(:model_name)
              @record.model_name
            elsif @record.class.respond_to?(:model_name)
              @record.class.model_name
            elsif @record.is_a?(Class)
              @record
            elsif @record.is_a?(Symbol)
              @record.to_s.classify
            else
              @record.class
            end
    "#{klass}"
  end
end