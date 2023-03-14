module Types
  class MutationType < Types::BaseObject
    field :add_to_cart, mutation: Mutations::AddToCart
    field :apply_discount, mutation: Mutations::ApplyDiscount
  end
end
