class StoreController < ApplicationController
  before_filter :find_cart

  # TODO: Messages are not being sent in the javascripts responses
  
  def index
    @products = Product.find_products_for_sale
  end

  def add_to_cart
    begin
      product = Product.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error("Attempt to access invalid product #{params[:id]}")
      redirect_to_index "Invalid product"
    else
      @current_item = @cart.add_product(product)
      respond_to do |format|
        format.html { redirect_to_index }
        format.js
      end
    end
  end

  def empty_cart
    @cart.items.clear
    respond_to do |format|
      format.html { redirect_to_index "Your Cart is currently empty" }
      format.js
    end
  end

  private
  def find_cart
    @cart = session[:cart] ||= Cart.new
  end

  def redirect_to_index(msg = nil)
    flash[:notice] = msg if msg
    redirect_to :action => :index
  end
end
