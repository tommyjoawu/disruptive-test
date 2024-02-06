class CoinInstance < ApplicationRecord
	belongs_to :investment
	belongs_to :coin
end
