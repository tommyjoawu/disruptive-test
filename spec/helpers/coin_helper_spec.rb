require 'rails_helper'
include CoinsHelper

RSpec.describe 'Verify Coins Helper', type: :helper do
    
end


RSpec.describe 'Verify Coins Helper', type: :helper do           
  context 'Connectin to API' do

    
    it 'global parameter for coinapi available' do
      value = GlobalParameter.find_by(code: "coinapi").try(:value)
      if expect(value).to be_present
        puts "Value: #{value} is present"
        puts "==========================================================================="
      end  
    end

    it 'initiate_coin_api method' do  
      api = initiate_coin_api
      if expect(api.class).to eq CoinAPIv1::Client
        puts "Initiate_coin_api method was successful"
        puts "==========================================================================="
      end  
    end

    #need to test the method that return coin_rate

    it 'calculate_coin_equivalent method' do  
      investment = 5000.00
      coin_rate = 0.5
      coin_equivalent = calculate_coin_equivalent(investment, coin_rate)
      if expect(coin_equivalent).to eq (10000)
        puts "Calculate_coin_equivalent method is calculating correctly"
        puts "==========================================================================="
      end  
    end

    it 'calculate_anual_profit method' do  
      investment = 5000.00
      coin_interest = 5.0
      anual_profit = calculate_anual_profit(investment, coin_interest)
      if expect(anual_profit).to eq (250)
        puts "Calculate_anual_profit method is calculating correctly"
        puts "==========================================================================="
      end  
    end

    it 'get_all_coins_exchange_rates method' do  
      exchange_rates = get_all_coins_exchange_rates
      if expect(exchange_rates).to be_an_instance_of_(Array)
        puts "Get_all_coins_exchange_rates method is working correctly"
        puts "==========================================================================="
      end  
    end

    

    

    # it 'cannot have currency as nil' do  
    #   expect { Investment.create!(balance: 100) }.to raise_error(ActiveRecord::RecordInvalid)  
    # end

    # it 'cannot have balance or currency as nil' do  
    #   expect { Investment.create! }.to raise_error(ActiveRecord::RecordInvalid)  
    # end
  end
end