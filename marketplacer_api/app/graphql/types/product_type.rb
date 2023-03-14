module Types
  class ProductType < Types::BaseObject
    field :id, ID, null: false
    field :uuid, Integer, null: false
    field :name, String, null: false
    field :price, Float, null: false
  end
end
