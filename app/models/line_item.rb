class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart, counter_cache: true
  belongs_to :order, optional: true
  # raise 'Appple'
  # validates :product_id, uniqueness: {scope: :cart_id, message: "Should be appt" }
  # validates :product_id, uniqueness: true
  # validates :cart_id, uniqueness: true

  def total_price
    product.price * quantity
  end

end
