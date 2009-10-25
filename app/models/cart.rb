class Cart < ActiveRecord::Base
  has_many :cart_items
  has_many :products, :through => :cart_items
  
  attr_reader :items

  # TODO: refactor the finders
  
  def add(product)
    items = find_items(product)
    product = Product.find(product)
    if items.size < 1
      ci = cart_items.create(:product_id => product.id,
                             :amount 	 => 1,
                             :price 	 => product.price)
    else
      ci = items.first
      increment_quantity(ci)
    end
    ci
  end

  def remove(product)
    ci = find_items(product)
    if ci.amount > 1
      decrement_quantity(ci)
    else
      CartItem.destroy(ci.id)
    end
    ci
  end

  def total_price
    cart_items.inject(0) { |sum, n| n.price * n.amount + sum }
  end

  def clear
    @cart.cart_items.destroy_all
    redirect_to_index
  end

  private
  def find_items(product)
    cart_items.find_all_by_product_id(product)
  end

  def increment_quantity(ci)
    ci.update_attributes(:amount => ci.amount + 1)
  end

  def decrement_quantity(ci)
    ci.update_attributes(:amount => ci.amount - 1)
  end
end
