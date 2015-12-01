class CustomersController < ApplicationController
	def show
		@Customer = Customer.find(params[:id])
	end
end