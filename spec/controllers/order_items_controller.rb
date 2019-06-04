require 'rails_helper'
RSpec.describe OrderItemsController do
  login_admin
  before(:each) {
    @product = FactoryGirl.create(:product)
    create_order(@product)
  }
  describe "POST #create" do
    context ".add item to cart" do
    it {
      post :create, params: {order_item: {product_id: @product.id, quantity: 1}, format: "js"}
      expect(@order.order_items.count).to eq(2)
    }
    end
  end
  describe "POST #update" do
    context ".update item in cart" do
      it {
        put :update, params: {id: @order_item.id, order_item: {product_id: @product.id, quantity: 2}, format: "js"}
        expect(@order.order_items.pluck(:quantity)).to eq([2])
      }
    end
  end
  describe "POST #destroy" do
    context "delete itmes from cart" do
      it {
        delete :destroy, params: {id: @order_item.id, format: "js"}
        expect(@order.order_items.count).to eq(0)
      }
    end
  end
end
