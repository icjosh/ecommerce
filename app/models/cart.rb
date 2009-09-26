class Cart
  attr_reader :items

  def initialize
    @items = []
  end

  # TODO: refactor the finders
  
  def add_product(product)
    current_item = @items.find { |item| item.product == product }
    if current_item
      current_item.increment_quantity
    else
      @items << CartItem.new(product)
    end
  end

  def remove_from_cart(product)
    @items.delete_if { |item| item.product == product }
  end

end
