Then /^I should have (\d+) product in Cart$/ do |count|
  Cart.total_items.should == count.to_i
end

