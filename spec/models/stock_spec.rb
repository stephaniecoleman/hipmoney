require 'rails_helper'

describe "Stock" do
  let(:apple_stock) { FactoryGirl.create(:stock) }
  let(:user1) { FactoryGirl.create(:user) }
  let(:user2) { FactoryGirl.create(:user) }


  it 'has a valid factory' do 
    expect(apple_stock).to be_valid
  end

  it 'has many users' do
  	user1.stocks << apple_stock
  	user2.stocks << apple_stock
  	expect(apple_stock.users).to include(user1, user2)
  end

end