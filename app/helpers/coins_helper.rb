module CoinsHelper
	def initiate_coin_api
		api = CoinAPIv1::Client.new(api_key: GlobalParameter.find_by(code: "coinapi").value)
	end

	def calculate_coin_equivalent(investment, coin_rate)
		return equivalent = investment / coin_rate
	end

	def calculate_anual_profit(investment, coin_interest)
		(investment * (coin_interest / 100) )
	end

	def get_all_coins_exchange_rates
		api = initiate_coin_api
		coins = Coin.all

		exchange_rates = []

		### At first I was getting all 3 coins one by one using the exchange_rates_get_specific_rate but since it seems like there is a limit and that is causing some errors because its returning nil, I am going to use the method that gives me all the coins and i will filter them myself

		# coins.each do |coin|
		# 	not_created = true
		# 	tries = 0
		# 	while not_created && tries < 3

		# 		begin
		# 			sleep 1
		# 			exchange_rates << exchange_rate = api.exchange_rates_get_specific_rate(asset_id_base: coin.code, asset_id_quote: 'USD')
		# 			not_created = false
		# 		rescue
		# 			tries += 1
		# 			puts "API Error - Coin Code: #{coin.code}"
		# 		end
		# 	end
		# end

		# results = api.exchange_rates_get_all_current_rates(asset_id_base: "USD")
		begin
			results = api.metadata_list_all_assets
			coins.pluck(:code).each do |coin|
				results.find { |r| exchange_rates << r if r[:asset_id] == coin } 
			end
		rescue
			puts "API ERROR"
		end

		return exchange_rates
	end
end
