Given /^I have products titled (.+)$/ do |titles|
  titles.split(', ').each do |title|
    Product.create!(:title => title, :price => 1,
                    :description => "dummy", :image_url => "dummy.jpg")
  end
end

Given /^I have no products$/ do
  Product.delete_all
end

Then /^I should have (\d+) products?$/ do |count|
  Product.count.should == count.to_i
end

