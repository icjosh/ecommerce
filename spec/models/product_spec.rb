require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Product do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
      :price => 9.99,
      :description => "value for description",
      :image_url => "value for image_url"
    }
  end

  it "should create a new instance given valid attributes" do
    Product.create!(@valid_attributes)
  end

  it "should not create a new instance given invalid price" do
    Product.create!(:title => title, :price => -50,
                    :description => "dummy",
                    :image_url => "test.jpg")
  end
end
