class UserStocksController < ApplicationController

	def create
  	# add stock to user's watchlist
  	@stock = Stock.find_by(name: params[:name])
  	current_user.stocks << @stock
  	respond_to do |format|
  		format.js
  	end
  end


end
