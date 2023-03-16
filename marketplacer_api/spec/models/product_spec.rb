# spec/models/product_spec.rb
require 'rails_helper'

RSpec.describe Product, type: :model do
  it "has a valid factory" do
    product = FactoryBot.build(:product)
    expect(product).to be_valid
  end

  it "is invalid without a name" do
    product = FactoryBot.build(:product, name: nil)
    expect(product).not_to be_valid
  end

  it "is invalid without a price" do
    product = FactoryBot.build(:product, price: nil)
    expect(product).not_to be_valid
  end
end
