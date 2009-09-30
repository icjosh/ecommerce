class Order < ActiveRecord::Base
  # TODO: Add Cart and CartItem to database to make associations work
  # belongs_to :cart
  attr_accessor :card_number, :card_verification

  def save
    # TODO: Implement
  end
end
