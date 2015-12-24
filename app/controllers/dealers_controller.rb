class DealersController < ApplicationController
	def show
		@Dealer = Dealer.find(params[:id])
	end
	def inventario
		@inventario = Order.all
	end
end