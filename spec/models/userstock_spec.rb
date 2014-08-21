require 'rails_helper'

describe "UserStock" do
	
	it 'validates whether a UserStock relation already exists' do
		UserStock.create(user_id: 1, stock_id: 2)
		expect(UserStock.create(user_id: 1, stock_id: 2)).not_to be_valid
	end

end