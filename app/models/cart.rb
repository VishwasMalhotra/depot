class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  # has_and_belongs_to_many :products
  has_many :products, -> {where enabled: true}, through: :line_items

def add_product(product_id)
  current_item = line_items.find_by(product_id: product_id)


# has_and_belongs_to_many association joint table entry.
  # self.products << Product.find(product_id)

  if current_item
    current_item.quantity += 1
  else
    current_item = line_items.build(product_id: product_id)
  end
  current_item
end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
end
