require 'rake'

desc 'Executa os testes e abre o relatório Allure'
task :test do
  puts "Iniciando os testes de automação..."

  begin
    sh 'bundle exec cucumber -p default -p allure --format json --out reports/dados.json'
  rescue
    puts "Alguns testes falharam, mas o relatório será gerado assim mesmo"
  end

  puts "Gerando relatório HTML customizado..."
  sh 'ruby relatorio.rb'

  puts "Gerando relatório visual Allure..."
  sh 'allure serve reports/allure-results'
end