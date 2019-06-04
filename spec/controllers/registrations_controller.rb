require "rails_helper"
require "cancan/matchers"
RSpec.describe RegistrationsController do
  login_admin
  describe "#admin"  do
    before(:each) { @ability = Ability.new(subject.current_user) }
    context "should have a current_user" do
      it { expect(subject.current_user).to_not eq(nil) }
    end
    context "should have role as admin" do
      it { assert @ability.can? :create, Product }
    end
  end
  describe ".user" do
    login_user
    context "should have session available" do
      it { assert subject.user_signed_in? }
    end
  end
end
