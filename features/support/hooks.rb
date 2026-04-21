require 'allure-cucumber'
require 'fileutils'

# Bloco que roda ANTES de cada cenário
Before do |scenario|
  # Garante que o navegador abra em tela cheia para evitar elementos escondidos
  page.driver.browser.manage.window.maximize
end

# Bloco que roda DEPOIS de cada cenário
After do |scenario|
  # Só executa a lógica de print se o cenário realmente falhou
  if scenario.failed?
    
    # 1. Cria as pastas necessárias caso elas não existam (essencial no Windows)
    # O 'mkdir_p' cria a árvore completa de uma vez (reports e screenshots)
    FileUtils.mkdir_p('reports/screenshots') unless Dir.exist?('reports/screenshots')

    # 2. Limpa o nome do cenário para ser um nome de arquivo válido
    nome_cenario = scenario.name.gsub(/[^A-Za-z0-9 ]/, '').gsub(/\s+/, '_').downcase
    caminho_print = "reports/screenshots/#{nome_cenario}.png"

    # 3. Tira o print da tela usando o Capybara
    page.save_screenshot(caminho_print)

    # 4. Anexa o arquivo de imagem ao relatório do Allure
    # O Allure lê o arquivo físico e incorpora no JSON do relatório
    Allure.add_attachment(
      name: "Evidencia de Erro",
      type: Allure::ContentType::PNG,
      source: File.open(caminho_print)
    )
  end

  # Opcional: Limpa a sessão do navegador para o próximo teste vir "limpo"
  # Capybara.current_session.driver.quit
end