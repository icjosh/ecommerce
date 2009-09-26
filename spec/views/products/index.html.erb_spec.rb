require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/products/index.html.erb" do
  include ProductsHelper

  before(:each) do
    assigns[:products] = [
      stub_model(Product,
        :title => "value for title",
        :price => 9.99,
        :description => "value for description",
        :image_url => "value for image_url"
      ),
      stub_model(Product,
        :title => "value for title",
        :price => 9.99,
        :description => "value for description",
        :image_url => "value for image_url"
      )
    ]
  end

  it "renders a list of products" do
    render
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", number_to_currency(9.99), 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
    response.should have_tag("tr>td", "value for image_url".to_s, 2)
  end
end
