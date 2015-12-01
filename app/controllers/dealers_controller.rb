class DealersController < ApplicationController
	def show
		@Dealer = Dealer.find(params[:id])
	end
end