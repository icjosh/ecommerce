class Product < ActiveRecord::Base
  has_many :cart_items
  has_many :carts, :through => :cart_items

  validates_uniqueness_of :title
  validates_presence_of :description
  validates_numericality_of :price, :greater_than => 0.01
  validates_format_of(:image_url,
                      :with => /\.(gif|jpg|png)$/i,
                      :message => "must be a URL for an image in GIF, JPG or PNG format")
  
  validates_length_of :title, :minimum => 10, :message => "seems too short"

  def self.find_products_for_sale
    find(:all, :order => "title")
  end
end
