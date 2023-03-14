module Types
  class CartType < Types::BaseObject
    field :id, ID, null: false
    field :total_cost, Float, null: false
    field :cart_items, [Types::CartItemType], null: false
  end
end
