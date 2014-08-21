require 'rails_helper'

describe "Authentications" do
  context "Clicking the sign in link" do
    it "should allow users to sign in with Google" do
    	FactoryGirl.create(:stock)
      login_with_google
      expect(page).to have_css('div.brand')
    end
  end
end

