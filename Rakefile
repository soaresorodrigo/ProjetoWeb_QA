require 'rake'

desc 'Executa os testes e abre o relatório Allure'
task :test do
  puts "Iniciando os testes de automação..."

  # O 'sh' executa comandos do terminal dentro do Ruby
  # Usamos o 'begin/rescue' porque se o teste falhar, 
  # o Ruby pode achar que o processo quebrou e não abrir o Allure.
  begin
    sh 'bundle exec cucumber -p allure'
  rescue
    puts "Alfuns testes falharam, mas o relatório será gerado assim mesmo"
  end

  puts "Gerando relatório visual..."
  sh 'allure serve reports/allure-results'
end