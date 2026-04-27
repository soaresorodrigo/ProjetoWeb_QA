# 🧪 ProjetoWEB_QA

Projeto de automação de testes E2E desenvolvido com **Ruby**, **Cucumber** e **Capybara + Selenium**, aplicado sobre a aplicação [SauceDemo](https://www.saucedemo.com). O projeto segue o padrão **Page Object Model (POM)** e gera relatórios visuais com **Allure**.

---

## 🛠️ Stack

| Ferramenta | Versão | Função |
|---|---|---|
| Ruby | 3.4 | Linguagem principal |
| Cucumber | latest | Framework BDD |
| Capybara | latest | Abstração de interações web |
| Selenium WebDriver | latest | Driver do navegador |
| RSpec | latest | Asserções |
| Allure Cucumber | latest | Relatórios visuais |

---

## 📁 Estrutura do projeto

```
ProjetoWEB_QA/
├── features/
│   ├── pages/                  # Page Objects
│   │   ├── login_page.rb
│   │   └── cart_page.rb
│   ├── step_definitions/       # Steps do Cucumber
│   │   ├── login_steps.rb
│   │   ├── shopping_steps.rb
│   │   └── remove_steps.rb
│   ├── support/                # Configurações
│   │   ├── env.rb
│   │   └── hooks.rb
│   ├── login.feature
│   ├── shopping.feature
│   └── remove_item.feature
├── Gemfile
├── Rakefile
├── cucumber.yml
└── relatorio.rb
```

---

## ✅ Cenários cobertos

- **Login** — credenciais válidas e inválidas
- **Carrinho** — adicionar produto e verificar badge
- **Remoção** — remover múltiplos produtos do carrinho (Scenario Outline)

---

## ▶️ Como executar

### Pré-requisitos

- Ruby 3.4+
- Google Chrome instalado
- Allure CLI instalado ([instruções](https://allurereport.org/docs/install/))

### Instalação

```bash
git clone https://github.com/soaresorodrigo/ProjetoWeb_QA.git
cd ProjetoWeb_QA
bundle install
```

### Rodar os testes e abrir relatório Allure

```bash
rake test
```

### Rodar só os testes (sem abrir relatório)

```bash
bundle exec cucumber
```

### Rodar uma feature específica

```bash
bundle exec cucumber features/login.feature
```

---

## 📊 Relatórios

O projeto gera dois tipos de relatório automaticamente ao rodar `rake test`:

- **Allure Report** — relatório visual interativo com evidências e screenshots de falha
- **HTML customizado** — gerado pelo `relatorio.rb` em `reports/resultado_final.html`

Screenshots de falha são capturados automaticamente e anexados ao relatório Allure.

---

## 🏗️ Padrões utilizados

- **Page Object Model (POM)** — separação entre lógica de página e steps
- **BDD com Gherkin** — cenários escritos em linguagem natural
- **Hooks** — configuração e teardown automáticos por cenário
- **Scenario Outline** — parametrização de cenários com múltiplos dados

---

## 👨‍💻 Autor

**Rodrigo Soares**  
Analista de Sistemas | QA Automation  
São Paulo, SP  

[![GitHub](https://img.shields.io/badge/GitHub-soaresorodrigo-181717?logo=github)](https://github.com/soaresorodrigo)
