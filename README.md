# Projeto Frontend Cucumber + Capybara
### Requisitos
* Ruby previamente instalado.
* Firefox Geckodriver instalado e configurado no PATH

### Passos:
* Baixar o repositório do https://bitbucket.org/​.
* Na pasta do projeto executar o comando 'bundle install'.
* São instaladas as gems Cucumber, Capybara, Selenium, Rspec, Site_prism e Pry.
* Na pasta do projeto executar no comando "cucumber -t @cenario1, @cenario2, @cenario3, @cenario4, CompanhiaAerea=@Companhia"
* É possível executar 1 ou mais cenários por execução, adicionando ou retirando do comando de execução.
  - ex.: "cucumber -t @cenario1, @cenario4, CompanhiaAerea=azul"
  - Serão executados somente os cenários 1 e 4 para a companhia "azul"
* Companhias disponíveis para teste, substitua no comando "@Companhia" pelo nome da Companhia.
  - "azul"
  - "gol"
  - "latam"
  - "aircanada"
  - "airfrance"
  - "american_airlines"
  - "british_airways"
  - "copa_airlines"
  - "delta_airlines"
  - "emirates"
  - "iberia"
  - "klm"
  - "lan"
  - "lifemiles"
  - "singapore"
  - "tap"
  - "united"
* O prompt de comando utilizado mostra os resultados dos testes.
* Na Pasta 'desafimaxmilhas/scenarios' são geradas as evidências dos testes executados, separados por Companhia_data-hora
