module Types
  class QueryType < Types::BaseObject
    field :products, [Types::ProductType], null: false

    def products
      Product.all
    end

    field :cart, Types::CartType, null: true do
      argument :id, ID, required: false
    end

    def cart(id: nil)
      id ? Cart.find(id) : (Cart.first || Cart.create)
    end
  end
end
