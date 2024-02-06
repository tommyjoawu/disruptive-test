class StaticPagesController < ApplicationController
  
  include CoinsHelper
  include ApplicationHelper

  def home
    @coins = Coin.all

    @exchange_rates = []
    api = initiate_coin_api    

    #In the end i commented this last section, i wanted to show the current rates for every coin but since the API isn't foolproof in the sense that sometimes it just returns nil as a result
    # @exchange_rates = get_all_coins_exchange_rates 
  end
end
