# spec/models/cart_item_spec.rb
require 'rails_helper'

RSpec.describe CartItem, type: :model do
  it "has a valid factory" do
    cart_item = FactoryBot.build(:cart_item)
    expect(cart_item).to be_valid
  end

  it "is invalid without a quantity" do
    cart_item = FactoryBot.build(:cart_item, quantity: nil)
    expect(cart_item).not_to be_valid
  end

  it "is invalid with a non-integer quantity" do
    cart_item = FactoryBot.build(:cart_item, quantity: 1.5)
    expect(cart_item).not_to be_valid
  end

  it "is invalid with a negative quantity" do
    cart_item = FactoryBot.build(:cart_item, quantity: -1)
    expect(cart_item).not_to be_valid
  end
end
