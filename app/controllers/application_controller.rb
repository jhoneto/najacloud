require "application_responder"

class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
  self.responder = ApplicationResponder
  respond_to :html

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_usuario!, :set_organizacao
  before_action :autorizar_acao, unless: :devise_controller?
  
  def pundit_user
    current_usuario
  end

  protected
    def autorizar_acao
      authorize controller_name.classify.constantize
    end

    def set_organizacao
      params[:por_organizacao] = current_usuario.organizacao_id if current_usuario
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :nome, :email, :password, :password_confirmation, :remember_me) }
      devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :email, :password, :remember_me) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
    end
    
  private
    
    def user_not_authorized(exception)
      policy_name = exception.policy.class.to_s.underscore
      flash[:error] = "Acesso não permitido"
      redirect_to(root_path)
    end
end
