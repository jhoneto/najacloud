class HomeController < ApplicationController
  before_action :autorizar_acao, except: [:index]
  def index

  end
end
