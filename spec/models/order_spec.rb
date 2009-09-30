require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Order do
  before(:each) do
    @attributes = {
      :cart_id => 1,
      :ip_address => "127.0.0.1",
      :first_name => "Adrian",
      :last_name => "Perez",
      :billing_address => "Edif. 854 Apto 23 Zona 7",
      :shipping_address => :billing_adress,
      :card_type => "visa",
      :card_expires_on => Date.new(2009, 12, 5)
    }
  end

  it "should reject invalid credit card" do
    @attributes[:card_number] = "40240071486735761"
    @attributes[:card_verification] = "123"
    order = Order.create(@attributes)
    order.valid?.should be_false
  end

  it "should accept valid credit card" do
    @attributes[:card_number] = "4024007148673576"
    @attributes[:card_verification] = "123"
    order = Order.create(@attributes)
    order.valid?.should be_true
  end
end
