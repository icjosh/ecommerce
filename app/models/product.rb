class Product < ActiveRecord::Base
  validates_presence_of :title, :description, :image_url
  validates_numericality_of :price, :greater_than => 0.01
  validates_format_of(:image_url,
                      :with => /\.(gif|jpg|png)$/i,
                      :message => "must be a URL for an image in GIF, JPG or PNG format")
  
  validates_length_of :title, :minimum => 10, :message => "seems too short"
end
