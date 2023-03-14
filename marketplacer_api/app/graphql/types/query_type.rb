module Types
  class QueryType < Types::BaseObject
    field :products, [Types::ProductType], null: false

    def products
      Product.all
    end

    field :cart, Types::CartType, null: false

    def cart
      Cart.first_or_create!(total_cost: 0.0)
    end
  end
end
