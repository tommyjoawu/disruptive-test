require 'rails_helper'

# RSpec.describe Investment, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

RSpec.describe 'Creating an Investment' do           
  context 'while creating' do
    it 'cannot have balance as nil' do  
      expect { Investment.create!(currency: "$") }.to raise_error(ActiveRecord::RecordInvalid)  
    end

    it 'cannot have currency as nil' do  
      expect { Investment.create!(balance: 100) }.to raise_error(ActiveRecord::RecordInvalid)  
    end

    it 'cannot have balance or currency as nil' do  
      expect { Investment.create! }.to raise_error(ActiveRecord::RecordInvalid)  
    end
  end
end