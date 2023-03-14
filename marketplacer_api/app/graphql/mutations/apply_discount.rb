module Mutations
  class ApplyDiscount < BaseMutation
    argument :cart_id, ID, required: true

    field :cart, Types::CartType, null: true
    field :errors, [String], null: false

    def resolve(cart_id:)
      cart = Cart.find(cart_id)

      discounts = [
        { threshold: 100, discount: 0.20 },
        { threshold: 50, discount: 0.15 },
        { threshold: 20, discount: 0.10 },
      ]

      discount_rate = 0.0
      discounts.each do |discount|
        if cart.total_cost > discount[:threshold]
          discount_rate = discount[:discount]
          break
        end
      end

      cart.total_cost -= (cart.total_cost * discount_rate)

      if cart.save
        {
          cart: cart,
          errors: []
        }
      else
        {
          cart: nil,
          errors: cart.errors.full_messages
        }
      end
    end
  end
end
