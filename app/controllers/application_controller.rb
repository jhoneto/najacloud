require "application_responder"

class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  self.responder = ApplicationResponder
  respond_to :html

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  # before_action :authenticate_usuario!, :set_organizacao
  # before_action :autorizar_acao, unless: :devise_controller?
  # after_action :registrar_atividade, unless: :devise_controller?

  def pundit_user
    current_usuario
  end

  def user_for_paper_trail
    current_usuario
  end

  protected
    def autorizar_acao
      set_unidade_do_usuario
      authorize controller_name.classify.constantize
    end

    def set_unidade_do_usuario
      current_usuario.unidade_id = nil
    end

    def set_organizacao
      params[:por_organizacao] = current_usuario.organizacao_id if current_usuario
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :nome, :email, :password, :password_confirmation, :remember_me) }
      devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :email, :password, :remember_me) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
    end

    def registrar_atividade
      LogAtividade.registrar(current_usuario.organizacao_id,
                             current_usuario.username,
                             browser.name,
                             request.remote_ip,
                             controller_name.to_s,
                             action_name)
    end

  private

    def user_not_authorized(exception)
      policy_name = exception.policy.class.to_s.underscore
      flash[:error] = "Acesso não permitido"
      redirect_to(:back)
    end
end
