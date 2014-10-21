class HomeController < ApplicationController
  before_action :autorizar_acao, except: [:index]
  def index
    #comentario 2
  end
end
