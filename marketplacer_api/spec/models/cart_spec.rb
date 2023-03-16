# spec/models/cart_spec.rb
require 'rails_helper'

RSpec.describe Cart, type: :model do
  # ... other tests ...

  it "calculates the total cost" do
    cart = create(:cart)
    product1 = create(:product, price: 10.0)
    product2 = create(:product, price: 20.0)

    cart.add_product(product1, 2) # 2 * 10.0 = 20.0
    cart.add_product(product2, 1) # 1 * 20.0 = 20.0

    expect(cart.total_cost).to eq(40.0)
  end
end
