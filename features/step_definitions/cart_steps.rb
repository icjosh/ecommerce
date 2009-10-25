Then /^I should have (\d+) items? in Cart$/ do |count|
  Cart.find(session[:cart_id]).cart_items.size.should == count.to_i
end

Then /^I should have "([^\"]*)" in Cart$/ do |title|
  cart = Cart.find(session[:cart_id])
  cart_items = cart.cart_items.find_all
  item = cart_items.find { |item| item.product.title == title }
  item.should_not be_nil
end



