require "rails_helper"
require 'byebug'
RSpec.describe ProductsController do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
       get :index
       expect(response).to be_success
       expect(response).to have_http_status(200)
     end
  end

  describe "GET #new" do
    context 'not authenticated' do
      it "responds successfully with an HTTP 200 status code" do
       get :new
       expect(flash[:alert]).to eq("You need to sign in or sign up before continuing.")
       expect(response).to have_http_status(302)
      end
    end

    context ".authenticated" do
      login_admin
      it "responds successfully with an HTTP 200 status code" do
       get :new
       expect(response).to have_http_status(200)
      end
    end
  end

  describe "POST #create" do
    context 'ask for login with admin permission' do
      it "redirect_to sign_in page" do
        post :create, params: {prodcut: {title: Faker::Name.name, price: Faker::Number.decimal(2)}}
        expect(response).to redirect_to "http://test.host/users/sign_in"
      end
    end
    context 'allow user to add prodcut if admin' do
      login_admin
      it "returns product object" do
        post :create, params: {product: {title: Faker::Name.name, price: Faker::Number.decimal(2)}}
         expect(response).to redirect_to "http://test.host/products"
      end
    end
  end
  describe "GET #edit" do
    context 'not authenticated' do
      it "responds successfully with an HTTP 200 status code" do
       get :edit, params: {id: 1}
       expect(flash[:alert]).to eq("You need to sign in or sign up before continuing.")
       expect(response).to have_http_status(302)
      end
    end
    context ".authenticated" do
      login_admin
      it "responds successfully with an HTTP 200 status code" do
       product = FactoryGirl.create(:product)
       get :edit, params: {id: 1}
       expect(response).to have_http_status(200)
      end
    end
  end
  describe "PUT #update" do
    before(:each) { @product = FactoryGirl.create(:product) }
    context 'ask for login with admin permission' do
      it "redirect_to sign_in page" do
        put :update, params: {product: {title: Faker::Name.name}, id: @product.id}
        expect(response).to redirect_to "http://test.host/users/sign_in"
      end
    end
    context 'allow user to add prodcut if admin' do
      login_admin
      it "returns product object" do
        put :update, params: {product: {title: Faker::Name.name}, id: @product.id}
        expect(flash[:notice]).to eq("Product was successfully updated.")
        expect(response).to have_http_status(302)
      end
    end
  end
  describe "GET #destroy" do
    login_admin
    before("GET #destroy") { @product = FactoryGirl.create(:product) }
    it "responds successfully with an HTTP 200 status code" do
      delete :destroy, params: {id: @product.id}
      expect(flash[:notice]).to eq("Product was successfully destroyed.")
      expect(response).to have_http_status(302)
    end
  end
end
