Given /^I have products titled (.+)$/ do |titles|
  titles.split(', ').each do |title|
    Product.create!(:name => title, :price => 1, :description => "dummy",
                    :image_url => "dummy.jpg",
                    :product_type_id => ProductTypes.find_by_name("Book"))
  end
end

Then /^I should have (\d+) products?$/ do |count|
  Product.count.should == count.to_i
end

