class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_customer!

  # Sirver para agregar un nuevo producto al pedido
  def add_product
    $id = params[:id]
    $cant = params[:cant]

    if session[:cart] then
      cart = session[:cart]
      
    else
      session[:cart] = {}
      cart = session[:cart]
    end
      cart[$id] = $cant
    redirect_to :action => :index
  end
  # GET /orders
  # GET /orders.json
  def index
    if session[:cart] then
      @cart = session[:cart]
      $cart = @cart

    else
      @cart = {}
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.first
  end
  def clearCart
    session[:cart] = nil
    redirect_to :action => :index
  end
  # GET /orders/new
  def new
      @order = current_customer.orders.new
      @order.productos = {}
      @order.productos.merge!($cart)
      @order.save
      session[:cart] = nil
    redirect_to "http://localhost:3000/"
  end

  # GET /orders/1/edit
  def edit
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:cliente, :productos)
    end
end