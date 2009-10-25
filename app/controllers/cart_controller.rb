class CartController < ApplicationController
  
  def add
    begin
      @product = Product.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error("Attempt to access invalid product #{params[:id]}")
      redirect_to_index "Invalid product"
    else
      @item = @cart.add(params[:id])
      respond_to do |format|
        format.html { redirect_to_index }
        format.js
      end
    end
  end

  def clear
    @cart.clear
    redirect_to_index
  end
  
  def redirect_to_index(msg = nil)
    flash[:notice] = msg if msg
    # TODO: fix this with ajax
    redirect_to products_path
  end

end
