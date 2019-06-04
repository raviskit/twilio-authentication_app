require "rails_helper"
require "byebug"
RSpec.describe PaymentsController do
  describe "POST #create" do
    context "generate pin" do
      login_user # registered a normal user
      it 'send to user'  do
         post :create, params: {format: "js"}
         assert !subject.current_user.otp.blank?
       end
    end
  end
  describe "POST #verify" do
    context "verify pin" do
      save_otp # this method registered with a otp .
      it 'verfy opt and make status true' do
        post :verify, params: {format: "js", pin: "1234"}
        assert subject.current_user.otp_verified
      end
    end
  end
end
