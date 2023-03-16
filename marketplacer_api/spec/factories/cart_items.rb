# spec/factories/cart_items.rb
FactoryBot.define do
  factory :cart_item do
    product
    cart
    quantity { Faker::Number.between(from: 1, to: 5) }
  end
end
