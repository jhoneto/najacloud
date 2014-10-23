# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'simplecov'
require 'simplecov-rcov'
require "pundit/rspec"
require 'capybara/poltergeist'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
#ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

Capybara.register_driver :poltergeist do |app|
  options = {
    :js_errors => false,
    :timeout => 120,
    :debug => false,
    :phantomjs_options => ['--load-images=no', '--disk-cache=false'],
    :inspector => true,
  }
  Capybara::Poltergeist::Driver.new(app, options) #, debug: true, window_size: [1300, 1000]) #, debug: true, window_size: [1300, 1000])
end

Capybara.javascript_driver = :poltergeist
Capybara.asset_host = "http://localhost:3000"

SimpleCov.start
SimpleCov.formatter = SimpleCov::Formatter::RcovFormatter

RSpec.configure do |config|
  # ## Mock Framework
  config.include(Capybara::DSL)
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = false

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"

  config.include FactoryGirl::Syntax::Methods

  config.include Devise::TestHelpers, :type => :controller

  #VER COMO OTIMIZAR ISSO!!!
  # config.before(:each) do
  #   @organizacao = create(:organizacao)
  #   @organizacao2 = create(:organizacao_2)
  #   @usuario = create(:usuario, organizacao_id: @organizacao.id)
  #   @usuario_sem_acesso = create(:usuario_sem_acesso, organizacao_id: @organizacao.id)
  #   #Associção dos acesso ao usuario
  #   @perfil = create(:perfil, organizacao_id: @organizacao.id)
  #   Direito.all.each do |direito|
  #     PerfilDireito.associar(@organizacao.id, direito.id, @perfil.id)
  #   end
  #   UsuarioPerfil.create(organizacao_id: @organizacao.id, usuario_id: @usuario.id, perfil_id: @perfil.id)
  # end

  config.before(:suite) do
    DatabaseCleaner.clean_with :truncation
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, :type => :acceptance) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end


