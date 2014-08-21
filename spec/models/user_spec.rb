require 'rails_helper'

describe "User" do
  let(:user) { FactoryGirl.create(:user) }
  let(:apple_stock) { FactoryGirl.create(:stock) }
  let(:google_stock) { FactoryGirl.build(:stock, ticker: "GOOG", name: "Google Inc.")}
  
  let(:google_callback) do

    OmniAuth::AuthHash.new({
      :provider => "google_oauth2",
      :uid => "123456789",
      :info => {
        :name => "John Doe",
        :email => "john@company_name.com",
        :first_name => "John",
        :last_name => "Doe",
        :image => "https://lh3.googleusercontent.com/url/photo.jpg"
        },
        :credentials => {
          :token => "token",
          :refresh_token => "another_token",
          :expires_at => 1354920555,
          :expires => true
          },
        :extra => {
          :raw_info => {
            :sub => "123456789",
            :email => "user@domain.example.com",
            :email_verified => true,
            :name => "John Doe",
            :given_name => "John",
            :family_name => "Doe",
            :profile => "https://plus.google.com/123456789",
            :picture => "https://lh3.googleusercontent.com/url/photo.jpg",
            :gender => "male",
            :birthday => "0000-06-25",
            :locale => "en",
            :hd => "company_name.com"
          }
        }
      })
  end

  it 'has a valid factory' do 
    expect(user).to be_valid
  end

  it 'has many stocks' do
    user.stocks.push apple_stock, google_stock
    expect(user.stocks).to include(apple_stock, google_stock)
  end

  it 'creates a new user from google omniauth' do
    expect{User.from_omniauth(google_callback)}.to change{User.all.count}.by(1)
  end


end

















