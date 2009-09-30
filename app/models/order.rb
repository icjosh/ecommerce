class Order < ActiveRecord::Base
  # TODO: Add Cart and CartItem to database to make associations work
  # belongs_to :cart
  attr_accessor :card_number, :card_verification

  # TODO: Add tests for this validation

  validate_on_create :validate_card

  def purchase
    response = GATEWAY.pruchase(price_in_cents, credit_card, :ip => ip_address)
    cart.update_attribute(:purchased_at, Time.now) if response.success?
    response.success?
  end

  def price_in_cents
    (cart.total_price * 100).round
  end

  private
  def validate_card
    unless credit_card.valid?
      credit_card.errors.full_messages.each do |message|
        errors.add_to_base(message)
      end
    end
  end

  def credit_card
    @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
      :type 			=> card_type,
      :number 			=> card_number,
      :verification_value 	=> card_verification,
      :month 			=> card_expires_on.month,
      :year 			=> card_expires_on.year,
      :first_name 		=> first_name,
      :last_name 		=> last_name                
    )
  end
end
