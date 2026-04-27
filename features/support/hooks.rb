require 'allure-cucumber'
require 'fileutils'

# Bloco que roda ANTES de cada cenário
Before do |scenario|
  # Garante que o navegador abra em tela cheia para evitar elementos escondidos
  page.driver.browser.manage.window.maximize
  @login =LoginPage.new
  @cart_page = CartPage.new
end

After do |scenario|
  if scenario.failed?
    FileUtils.mkdir_p('reports/screenshots') unless Dir.exist?('reports/screenshots')
    nome_cenario = scenario.name.gsub(/[^A-Za-z0-9 ]/, '').gsub(/\s+/, '_').downcase
    caminho_print = "reports/screenshots/#{nome_cenario}.png"
    page.save_screenshot(caminho_print)
    Allure.add_attachment(
      name: "Evidencia de Erro",
      type: Allure::ContentType::PNG,
      source: File.open(caminho_print)
    )
  end

  Capybara.current_session.driver.quit  # ← centralizado aqui
end