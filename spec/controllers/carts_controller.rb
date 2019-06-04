require "rails_helper"
require "byebug"
RSpec.describe CartsController do
  describe "GET #show" do
    before(:each) { @order = FactoryGirl.create(:order) }
    it "dispays no. of item in cart" do
      get :show
      assert   @order.order_items.is_a?(ActiveRecord::Associations::CollectionProxy)
    end
  end
end
