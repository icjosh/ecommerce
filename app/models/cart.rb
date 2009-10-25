class Cart < ActiveRecord::Base
  has_many :cart_items
  has_many :products, :through => :cart_items
  
  attr_reader :items

  # TODO: refactor the finders
  
  def add(product)
    items = cart_items.find_all_by_product_id(product)
    product = Product.find(product)
    if items.size < 1
      ci = cart_items.create(:product_id => product.id,
                             :amount 	 => 1,
                             :price 	 => product.price)
    else
      ci = items.first
      ci.update_attributes(:amount => ci.amount + 1)
    end
    ci
  end

  def total_price
    cart_items.inject(0) { |sum, n| n.price * n.amount + sum }
  end

  def remove_from_cart(product)
    # TODO: fix
    # @items.delete_if { |item| item.product == product }
  end

end
