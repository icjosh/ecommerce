class OrdersController < ApplicationController
  # A little bit of a hack get rid of this
  before_filter :find_cart, :except => :new
  
  def new
    @order = Order.new
  end

  def create
    @order = @current_cart.build_order(params[:order])
    @order.ip_address = request.remote_ip
    if @order.save
      if @order.purchase
        render :action => "success"
      else
        render :action => "failure"
      end
      
    else
      render :action => "new"
    end
  end

  private
  def find_cart
    @current_cart = session[:cart] ||= Cart.new
  end

end
