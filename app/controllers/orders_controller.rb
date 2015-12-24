class OrdersController < ApplicationController
  before_action :authenticate_customer!, only: [:new]

  # Sirver para agregar un nuevo producto al pedido
    def add_product

    $categoria = params[:cate]
    $id = params[:id]
    $cantidad = params[:cant]

    $producto = {$id => $cantidad}

  if session[:cart] then
      cart = session[:cart]
      
    else
      session[:cart] = {}
      cart = session[:cart]
    end

    if cart[$categoria]
            cart[$categoria].merge!($producto)
    else
            cart[$categoria] = ($producto)
    end
      $cart = session[:cart]
      $cart = @cart

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
      $categoria = params[:categoria]

      $cart.each do  |cate, prod|
        if cate == $categoria
          $peo = prod
        end
      
      end


#hoy = 6
#entrega = 6
#if entrega > hoy
#entrega = hoy - entrega
#else
#entrega = hoy - entrega 
#entrega = 7 - entrega
#end 
#@fecha_entrega = entrega.abs


      @order = Order.find_or_create_by(customer_id:  2)
      if @order
        @produ = @order.productos.merge!($peo)
       @order.update(:productos => @produ)
      end
      session[:cart] = nil
      redirect_to "http://localhost:3000/"
  end

end