class Investment < ApplicationRecord

	include CoinsHelper
	include ActionView::Helpers::NumberHelper
	require 'csv'

	validates_presence_of :balance, :currency

	has_many :coin_instances, dependent: :destroy

	after_save :create_coin_instances

	def create_coin_instances
		coins = Coin.all
		#We will get the exchange rates for the coins available in our application
		exchange_rates = get_all_coins_exchange_rates

		coins.each do |coin|
			#We will create a Coin Instance for each existing Coin record, for the purpose of this test there will be only 3 Coins available so the entire system is designed having this in mind, if there were many more possible Coins I would take another approach since it wouldn't be practical to generate so many records after every Investment made

			#We will by default handle everything with USD so we won't bother thinking about giving it a variable, we can just hard code it
			exchange_rate = exchange_rates.find{|r| r[:asset_id] == coin.code}

			#When exchange_rate isn't present, it means that the search had 0 matches which means that the API didn't return one of the Coins (ETH, BTC or ADA, usually ADA is the main culprit, since we do not have control over the API, we will just skip the missing coin)
			if exchange_rate.present?
				
				rate = exchange_rate[:price_usd]
				balance = self.balance
				coin_equivalent = calculate_coin_equivalent(self.balance, rate)
				anual_profit = calculate_anual_profit(balance, coin.monthly_interest)

				#Every record will be used as reference in case we want to check investments made previously, since crypto is so volatile, the prices change pretty often.

				#Another way of doing this would be to check via API while adding the timestamp but since it seems like the API sometimes doesn't return anything or just plainly returns nil, it might be safer to keep some records instead of relying so much on the API, just to be on the safer side
				coin_instance = self.coin_instances.create(
					coin_id: coin.id, 
					currency: self.currency,
					value_at_the_time: rate,
					coin_equivalent: coin_equivalent,
					anual_profit: anual_profit,
					total: balance + anual_profit
					)
			end

		end
		
	end

	def records_to_csv
		records = self.coin_instances
		CSV.generate do |csv|

			#We populate the CSV file with the headers
			csv << [
				"Coin",
				"Code",
				"Current Rate",
				"Monthly Interest (%)",
				"Interest (Yearly)",
				"Total"]

			#Now that we have the headers, we will populate it with the records data
			records.each do |r|
				csv << [
					r.coin.description,
					r.coin.code,
					number_to_currency(r.value_at_the_time, :unit => "$"),
					r.coin.monthly_interest,
					number_to_currency(r.anual_profit, :unit => "$"),
					number_to_currency(r.total, :unit => "$")
				]
			end
		end
	end
end
