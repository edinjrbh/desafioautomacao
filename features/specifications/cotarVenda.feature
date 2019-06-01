#language: pt

Funcionalidade: Cotar Venda de Milhas
  Como cliente MaxMilhas
  Posso acessar o site MaxMilhas
  E fazer uma cotação de vendas de milhas

Contexto: Acessar Companhias Aereas
  Dado que eu acesse o site Maxmilhas
  Quando acionar o link Vender suas Milhas
  E o botão Faça Sua Venda
  E selecionar a <Companhia> Aerea
  Então o sistema exibe a tela Vender milhas

@cenario1
Cenario: Cotação de Venda
  Dado que esteja na tela Vender milhas
  Quando preencher o campo <Quantidade> de milhas?
  E o campo Qual <Valor> para cada mil milhas?
  Então o sistema calcula e exibe o Valor a receber

@cenario2
Cenario: Cotação valor menor que o Minimo
  Dado que esteja na tela Vender milhas
  Quando preencher o campo <Quantidade> de milhas? com valor menor que o minimo
  Então o sistema mensagem de alerta valor minimo

@cenario3
Cenario: Cotação valor acima do Maximo
  Dado que esteja na tela Vender milhas
  Quando preencher o campo <Quantidade> de milhas? com valor maior que o maximo
  Então o sistema mensagem de alerta valor maximo

@cenario4
Cenario: Cotação valor alterado
  Dado que esteja na tela Vender milhas
  Quando preencher o campo <Quantidade> de milhas?
  E alterar o campo Quantidade de milhas? para uma valor mais alto
  Então o sistema altera o Valor sugerido
