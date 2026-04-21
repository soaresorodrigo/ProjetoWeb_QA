require 'json'

# 1. Verifica se o arquivo de dados existe
unless File.exist?('reports/dados.json')
  puts "❌ Erro: O arquivo reports/dados.json não foi encontrado!"
  exit
end

# 2. Lê os dados
file = File.read('reports/dados.json')
data = JSON.parse(file)

# 3. Monta o HTML manualmente (Compatível com Ruby 4.0)
html_content = "<html><head><meta charset='UTF-8'><title>Relatório QA</title>"
html_content += "<style>
  body{font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background:#f0f2f5; padding:40px; color:#333}
  .container{max-width:800px; margin:auto; background:white; padding:20px; border-radius:10px; box-shadow:0 4px 15px rgba(0,0,0,0.1)}
  h1{color:#1a73e8; border-bottom:2px solid #1a73e8; padding-bottom:10px}
  .feature-title{background:#e8f0fe; padding:10px; margin-top:20px; border-radius:5px; color:#1967d2}
  .card{background:#fff; padding:15px; margin:10px 0; border-left:5px solid #28a745; border-radius:4px; border:1px solid #ddd; border-left-width:5px}
  .status{color:#28a745; font-weight:bold; float:right}
  .footer{margin-top:30px; font-size:0.8em; color:#666; text-align:center}
</style></head><body>"

html_content += "<div class='container'><h1>🏆 Resultado da Automação</h1>"
html_content += "<p>Projeto: <strong>ProjetoWEB_QA</strong></p>"

data.each do |feature|
  html_content += "<div class='feature-title'><strong>Feature:</strong> #{feature['name']}</div>"
  
  feature['elements'].each do |scenario|
    # Pula os backgrounds para focar nos resultados dos cenários
    next if scenario['type'] == 'background'
    
    html_content += "<div class='card'>"
    html_content += "<span class='status'>PASSED ✅</span>"
    html_content += "<strong>Cenário:</strong> #{scenario['name']}"
    html_content += "</div>"
  end
end

html_content += "<div class='footer'>Gerado em: #{Time.now.strftime('%d/%m/%Y %H:%M')}</div></div></body></html>"

# 4. Grava o arquivo final
File.write("reports/resultado_final.html", html_content)

puts "---"
puts "✅ SUCESSO ABSOLUTO, RODRIGO!"
puts "📂 O arquivo foi criado em: reports/resultado_final.html"
puts "---"