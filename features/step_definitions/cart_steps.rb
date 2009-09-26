Then /^I should have (\d+) items? in Cart$/ do |count|
  session[:cart].items.size.should == count.to_i
end

Then /^I should have "([^\"]*)" in Cart$/ do |title|
  item = session[:cart].items.find { |item| item.product.title == title }
  item.should_not be_nil
end



