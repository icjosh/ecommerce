# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def title(content)
    content_for(:title, content)
  end

  def head(&content)
    content_for(:head, content)
  end

  def add_product_to_cart_button(product)
    button_to "Add to Cart", {
      :controller => 'Cart',
      :action 	  => 'add',
      :id 	  => product
    },
    :dojoType 	=> "dijit.form.Button",
    :iconClass => "addToCartIcon",
    :label => "Add to Cart"
  end
end
