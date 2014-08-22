require 'rails_helper'

describe "Watchlist" do

  # Methods are defined in rails_helper.rb

  before(:each) do
    FactoryGirl.create(:stock)
    login_with_google
    search_stocks
  end

  context "Clicking the plus sign icon" do
    it "should allow users to search for stocks", :js => true do
      expect(page).to have_content('Apple Inc.')
    end
  end

  context "Selecting a stock from the search results" do
    it "should add that stock to the watchlist", :js => true do
      select_stock_from_search
      expect(page).to have_css('li[data-name="Apple"]')
    end
    it "should display that stock's ticker at the top of the watchlist", :js => true do
      expect(page).to have_selector('h2', :text => "AAPL")
    end
  end

  context "Clicking the minus sign icon on a stock" do
    it "removes the stock from the watchlist", :js => true do
      select_stock_from_search
      delete_stock
      expect(page).not_to have_css('li[data-name="Apple"]')
    end
  end

end