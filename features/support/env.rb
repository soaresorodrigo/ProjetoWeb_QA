require 'capybara/cucumber'
require 'selenium-webdriver'
require 'fileutils' # Biblioteca para manipular arquivos
require 'allure-cucumber'


# Carrega automaticamente tudo que estiver dentro da pasta pages
Dir[File.join(File.dirname(__FILE__), '../pages/*.rb')].each { |file| require file }

# Comando para deletar a pasta reports e criar uma nova
FileUtils.rm_rf('reports') if Dir.exist?('reports')
FileUtils.mkdir_p('reports')

AllureCucumber.configure do |config|
  config.results_directory = 'reports/allure-results'
  config.clean_results_directory = true
end

Capybara.register_driver :selenium_chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  
  # O 'incognito' ajuda muito a não carregar perfis com senhas salvas
  options.add_argument('--incognito')
  options.add_argument('--disable-gpu')
  options.add_argument('--no-sandbox')
  
  # --- AS LINHAS QUE DEVEM RESOLVER O SEU PROBLEMA NO WINDOWS ---
  # Desativa a integração com a API de chaves/senhas do Windows (o pop-up azul/cinza)
  options.add_argument('--disable-features=WebAuthenticationUseNativeWinApi')
  
  # Impede o Chrome de perguntar sobre salvar senhas
  options.add_preference('credentials_enable_service', false)
  options.add_preference('profile.password_manager_enabled', false)
  # -------------------------------------------------------------

  service = Selenium::WebDriver::Chrome::Service.new
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options, service: service)
end

Capybara.configure do |config|
    config.default_driver = :selenium_chrome
    config.app_host = 'https://www.saucedemo.com'
    config.default_max_wait_time = 10
end
