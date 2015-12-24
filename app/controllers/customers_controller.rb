class CustomersController < ApplicationController
	def show
		@Customer = Customer.find(params[:id])
		@Order = Order.where(customer_id: @Customer ).last(5)

	end
end