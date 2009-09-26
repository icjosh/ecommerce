require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

fixtures :products

describe Cart do
  before(:each) do
    @valid_attributes = {
      
    }
  end

  it "should create a new instance given valid attributes" do
    Cart.create!(@valid_attributes)
  end

  it "should add a new product" do
    Product = 
  end
end
