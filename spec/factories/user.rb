FactoryGirl.define do
	factory :user do
		provider {"google_oauth2"}
		uid {"102160018772647708253"} 
		name {"Jon Snow"} 
		oauth_token {"ya29.YQA4uBy9dCKilx0AAADpMd5nFhiCJhbOEa_nTaGMStw3Y"}
		oauth_expires_at {"2014-08-14 19:29:21"} 
		profile_pic {"https://lh3.googleusercontent.com/-KGBj8yGeTic/AAA"}
	end
end