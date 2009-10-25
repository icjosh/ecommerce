class Cart < ActiveRecord::Base
  has_many :cart_items
  has_many :products, :through => :cart_items
  
  attr_reader :items

  # TODO: refactor the finders
  
  def add_product(product)
    current_item = @items.find { |item| item.product == product }
    if current_item
      current_item.increment_quantity
    else
      @items << CartItem.new(product)
    end
    current_item
  end

  def remove_from_cart(product)
    @items.delete_if { |item| item.product == product }
  end

  def total_price
    @items.sum { |item| item.price }
  end

end
