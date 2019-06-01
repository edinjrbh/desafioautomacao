class Vendas < SitePrism::Page
	#Acessar Cotação
	element :link_vendas, 'a[href="/vender-milhas"]'
	element :botao_faca_sua_venda, 'button[data-action="ballons-make-your-sale"]'
	#Selecionar Cia

	element :pagina_cia, '#content1 > h3:nth-child(1)'
	Cia ||=ENV['CompanhiaAerea'].downcase
	case Cia
		when "azul"
			element :cia, 'a[data-action="ballons-cia-national-card-azul"]'
		when "gol"
			element :cia,'a[data-action="ballons-cia-national-card-gol"]'
		when 'latam'
			element :cia, 'a[data-action="ballons-cia-national-card-latam"]'
		when 'aircanada'
			element :cia, 'a[href="/vender-milhas/aircanada-aeroplan"]'
		when 'airfrance'
			element :cia, 'a[href="/vender-milhas/airfrance-flyingblue"]'
		when 'american_airlines'
			element :cia, 'a[href="/vender-milhas/american-aadvantage"]'
		when 'british_airways'
			element :cia, 'a[href="/vender-milhas/british-avios"]'
		when 'copa_airlines'
			element :cia, 'a[href="/vender-milhas/copa-connectmiles"]'
		when 'delta_airlines'
			element :cia, 'a[href="/vender-milhas/delta-skymiles"]'
		when 'emirates'
			element :cia, 'a[href="/vender-milhas/emirates-skyawards"]'
		when 'iberia'
			element :cia, 'a[href="/vender-milhas/iberia-avios"]'
		when 'klm'
			element :cia, 'a[href="/vender-milhas/klm-flyingblue"]'
		when 'lan'
			element :cia, 'a[href="/vender-milhas/lan-latampass"]'
		when 'lifemiles'
			element :cia, 'a[href="/vender-milhas/lifemiles-lifemiles"]'
		when 'singapore'
			element :cia, 'a[href="/vender-milhas/singapore-krisflyer"]'
		when 'tap'
			element :cia, 'a[href="/vender-milhas/tap-victoria"]'
		when 'united'
			element :cia, 'a[href="/vender-milhas/united-mileageplus"]'
		else
			puts "Companhia Invalida"
	end

	# Campos para Cotação
	element :tela_cotacao, '.offers-vender-milhas__header--title'
	element :milhas, 'input[data-action="simulator-miles-quant-miles"]'
	element :valor, 'input[data-action="simulator-miles-price"]'
	element :total_valor, 'strong[class="simulator-miles--total-price"]'
	element :max_sugerido, 'p.text-right > strong:nth-child(2)'
	element :valor_minmax, 'p[class="text-right simulator-miles--suggest"]'
	#Mensagens
	element :msg_alerta, 'p[class="text-right text-invalid"]'
end
