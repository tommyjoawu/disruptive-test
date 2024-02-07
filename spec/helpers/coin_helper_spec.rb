require 'rails_helper'
include CoinsHelper

RSpec.describe 'Verify Coins Helper', type: :helper do
    
end


RSpec.describe 'Verify Coins Helper', type: :helper do           
  context 'Connectin to API' do

    
    it 'global parameter for coinapi available' do
      value = GlobalParameter.find_by(code: "coinapi").try(:value)
      puts "Testing GlobalParameter - code: coinapi - Value: #{value}"
      if expect(value).to be_present
        puts "Value is present"
      end  
    end

    it 'initiate_coin_api method' do  
      api = initiate_coin_api
      if expect(api.class).to eq CoinAPIv1::Client
        puts "initiate_coin_api method was successful"
      end  
    end

    #need to test the method that return coin_rate

    it 'calculate_coin_equivalent method' do  
      investment = 5000
      coin_rate = 0.5
      coin_equivalent = calculate_coin_equivalent(investment, coin_rate)
      if expect(coin_equivalent).to eq (10000)
        puts "calculate_coin_equivalent method is calculating correctly"
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