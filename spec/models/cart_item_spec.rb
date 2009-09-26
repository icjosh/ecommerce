require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CartItem do
  before(:each) do
    @product = Product.new(:title => "Mp3 Player",
                           :description => "Awesome Mp3 player",
                           :price => 30.95
                           )
  end
  
  
  # TODO: refactor all this tests into factories/fixtures
  it "should wrap a product into a CartItem" do
    @cart_item = CartItem.new(@product)
    @cart_item.title.should == "Mp3 Player"
    @cart_item.price.should == 30.95
    @cart_item.increment_quantity.should == 2  
  end
end
