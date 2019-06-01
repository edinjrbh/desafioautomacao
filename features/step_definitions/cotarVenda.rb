vendas = Vendas.new
#Contexto
Dado(/^que eu acesse o site Maxmilhas$/) do
  visit 'https://www.maxmilhas.com.br'
  Pasta ||=(ENV['CompanhiaAerea']).downcase+'_'+(Time.now.strftime("%d-%m-%Y_%k-%M"))
  page.save_screenshot('scenarios/'+Pasta+'/paginaInicial.png')
end

Quando(/^acionar o link Vender suas Milhas$/) do
  vendas.link_vendas.click
  page.save_screenshot('scenarios/'+Pasta+'/vendaSuasMilhas.png')
end

Quando(/^o botão Faça Sua Venda$/) do
  vendas.botao_faca_sua_venda.click
  page.save_screenshot('scenarios/'+Pasta+'/selecioneCompanhia.png')
end

Quando(/^selecionar a <Companhia> Aerea$/) do
  expect(vendas.pagina_cia.text).to start_with('Em qual companhia estão suas milhas?')
  vendas.cia.click
  page.save_screenshot('scenarios/'+Pasta+'/companhiaSelecionada.png')
end

Então(/^o sistema exibe a tela Vender milhas$/) do
  expect(vendas.tela_cotacao.text).to start_with('Vender milhas')
  page.save_screenshot('scenarios/'+Pasta+'/formulárioCotarVazio.png')
end

#Cenario 1
Dado(/^que esteja na tela Vender milhas$/) do
  expect(vendas.tela_cotacao.text).to start_with('Vender milhas')
end

Quando(/^preencher o campo <Quantidade> de milhas\?$/) do
  #Pega o valor da Quantidade Minima de Milhas para Venda
  VlrMilhas ||= page.find('input[data-action="simulator-miles-quant-miles"]')['placeholder']
  Qnt ||= (VlrMilhas.slice!(9..(VlrMilhas.length-1))).gsub '.', ''
  vendas.milhas.set(Qnt)
  puts "Quantidade Minima: "+Qnt
  page.save_screenshot('scenarios/'+Pasta+'/informarMilhas.png')
end

Quando(/^o campo Qual <Valor> para cada mil milhas\?$/) do
  #Pega o Valor Maximo R$ sugerido
  Vlr ||= ((vendas.max_sugerido.text).gsub'R$ ', '').gsub',','.'
  puts "Valor Máximo Sugerido" + Vlr
  vendas.valor.set(Vlr)
  page.save_screenshot('scenarios/'+Pasta+'/informarValor.png')
end

Então(/^o sistema calcula e exibe o Valor a receber$/) do
  Valor_total ||= ((Qnt.to_f * Vlr.to_f)/1000).round(2)
  StrValor ||= "R$ %0.02f" % Valor_total.round(2)
  expect(vendas.total_valor.text).to eq(StrValor.gsub '.', ',')
  page.save_screenshot('scenarios/'+Pasta+'/valorCotacao.png')
end

#Cenario 2
Quando(/^preencher o campo <Quantidade> de milhas\? com valor menor que o minimo$/) do
  VlrMilhasMenor ||= page.find('input[data-action="simulator-miles-quant-miles"]')['placeholder']
  Qnt ||= (VlrMilhasMenor.slice!(9..(VlrMilhasMenor.length-1))).gsub '.', ''
  vendas.milhas.set(Qnt.to_i-1)
  page.save_screenshot('scenarios/'+Pasta+'/valorCotacaoMin.png')
end

Então(/^o sistema mensagem de alerta valor minimo$/) do
  expect(vendas.msg_alerta.text).to start_with("A oferta precisa ter no mínimo ")
  puts vendas.msg_alerta.text
  page.save_screenshot('scenarios/'+Pasta+'/alertaValorCotacaoMin.png')
end

#Cenario 3
Quando(/^preencher o campo <Quantidade> de milhas\? com valor maior que o maximo$/) do
  vendas.milhas.set(9999999)
  page.save_screenshot('scenarios/'+Pasta+'/valorCotacaoMax.png')
end

Então(/^o sistema mensagem de alerta valor maximo$/) do
  expect(vendas.msg_alerta.text).to start_with("A oferta precisa ter no máximo")
  puts vendas.msg_alerta.text
  page.save_screenshot('scenarios/'+Pasta+'/alertaValorCotacaoMax.png')
end

#Cenario 4
Quando(/^alterar o campo Quantidade de milhas\? para uma valor mais alto$/) do
  VlrSugerido ||= vendas.valor_minmax.text
  page.save_screenshot('scenarios/'+Pasta+'/valorSugerido-1.png')
  vendas.milhas.set(9999999)
  VlrMilhasMaximo ||= vendas.msg_alerta.text
  page.save_screenshot('scenarios/'+Pasta+'/alertaValorCotacaoMax2.png')
  VlrMilhasMaximo ||= VlrMilhasMaximo.slice!(30..(VlrMilhasMaximo.length-8)).gsub '.', ''
  vendas.milhas.set(VlrMilhasMaximo)
  page.save_screenshot('scenarios/'+Pasta+'/alertaValorCotacaoMax.png')
end

Então(/^o sistema altera o Valor sugerido$/) do
  puts vendas.valor_minmax.text
  expect(vendas.valor_minmax.text).not_to eq(VlrSugerido)
  page.save_screenshot('scenarios/'+Pasta+'/valorSugerido-2.png')
end
