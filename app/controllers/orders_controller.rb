class OrdersController < ApplicationController
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

  #Sirve para ver la factura antes de comprarla

  def index
    if session[:cart] then
      @cart = session[:cart]
      $cart = @cart

    else
      @cart = {}
    end
  end

  #Sirve para visualizar la factura en un futuro pero ta comprada

  def show
    @order = Order.find(params[:id])
  end

  #Sirve para borrar el contenido del carrito de compras

  def clearCart
    session[:cart] = nil
    redirect_to :action => :index
  end

#Sirve para hacer la compra y quedar guarda en la base de datos

    def new
      @fecha_entrega = Date.today
      @order = current_customer.orders.new
      @order.productos = {}
      @order.productos.merge!($cart)
      @order.save
    
      session[:cart] = nil
      redirect_to "http://localhost:3000/"
  end

end