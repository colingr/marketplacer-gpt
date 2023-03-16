# spec/requests/graphql_spec.rb
require 'rails_helper'

RSpec.describe "GraphQL API", type: :request do
  describe "products query" do
    it "returns a list of products" do
      product1 = FactoryBot.create(:product)
      product2 = FactoryBot.create(:product)

      # spec/requests/graphql_spec.rb
      post '/graphql', params: { query: '{ products { id name price } }' }
      json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(json['data']['products'].length).to eq(2)
    end
  end

  describe "addToCart mutation" do
    it "adds a product to the cart and updates the total cost" do
      product = FactoryBot.create(:product, price: 10.0)

      query = <<~GQL
        mutation {
          addToCart(input: { productId: #{product.id}, quantity: 2 }) {
            cartItem {
              product {
                id
                name
                price
              }
              quantity
            }
            errors
          }
        }
      GQL

      post '/graphql', params: { query: query }
      json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(json['data']['addToCart']['cartItem']['product']['id'].to_i).to eq(product.id)
      expect(json['data']['addToCart']['cartItem']['quantity']).to eq(2)

      cart = Cart.first
      expect(cart.total_cost).to eq(20.0)
    end
  end

  describe "cart query" do
    it "returns cart details with total cost and cart items" do
      cart = FactoryBot.create(:cart, total_cost: 0.0)
      product1 = FactoryBot.create(:product, price: 10.0)
      product2 = FactoryBot.create(:product, price: 20.0)
      FactoryBot.create(:cart_item, cart: cart, product: product1, quantity: 1)
      FactoryBot.create(:cart_item, cart: cart, product: product2, quantity: 2)
      cart.update(total_cost: 50.0)

      post '/graphql', params: { query: '{ cart { id totalCost cartItems { id product { name price } quantity } } }' }
      json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(json['data']['cart']['id'].to_i).to eq(cart.id)
      expect(json['data']['cart']['totalCost']).to eq(50.0)
      expect(json['data']['cart']['cartItems'].length).to eq(2)
    end
  end
end
