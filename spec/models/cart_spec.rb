require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

# TODO: add fixtures or factories here

describe Cart do
  before(:each) do
    @valid_attributes = {
      
    }
    @cart = Cart.new
    @product = Product.new(:title => "Mp3 Player",
                           :description => "Awesome Mp3 player",
                           :price => 30.95)
  end

  it "should create a new instance given valid attributes" do
    Cart.new
  end

  it "should add a new product to Cart" do
    @cart.add_product(@product)
    @cart.items[0].product.should == @product
    @cart.items.size.should == 1
  end

  it "should increment quantity if product already in Cart" do
    2.times { @cart.add_product(@product) }
    @cart.items.size.should == 1
    @cart.items[0].quantity.should == 2
  end
end
