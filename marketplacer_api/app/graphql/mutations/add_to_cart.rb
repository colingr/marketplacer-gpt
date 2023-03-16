module Mutations
  class AddToCart < BaseMutation
    argument :product_id, ID, required: true
    argument :quantity, Integer, required: true

    field :cart_item, Types::CartItemType, null: true
    field :errors, [String], null: false

    def resolve(product_id:, quantity:)
      cart = Cart.first_or_create!(total_cost: 0.0)
      product = Product.find(product_id)

      cart_item = CartItem.new(
        product: product,
        cart: cart,
        quantity: quantity
      )

      if cart_item.save
        # Update the cart's total cost
        cart.total_cost += (product.price * quantity)
        cart.save

        {
          cart_item: cart_item,
          errors: []
        }
      else
        {
          cart_item: nil,
          errors: cart_item.errors.full_messages
        }
      end
    end
  end
end
