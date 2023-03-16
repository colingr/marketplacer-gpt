class Cart < ApplicationRecord
  has_many :cart_items
  has_many :products, through: :cart_items

  def add_product(product, quantity)
    cart_item = cart_items.find_or_initialize_by(product: product)
    cart_item.quantity = (cart_item.quantity || 0) + quantity
    cart_item.save!
    recalculate_total_cost
  end

  def recalculate_total_cost
    self.total_cost = cart_items.includes(:product).sum { |item| item.product.price * item.quantity }
    save!
  end
end
