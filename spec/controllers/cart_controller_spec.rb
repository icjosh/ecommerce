require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CartController do

  it "should add item to Cart" do
    assert_diference(CartItem, :count) do
      post :add, :id => 4
    end
    Cart.find(@request.session[:cart_id].items.size).should == 1
  end

end
