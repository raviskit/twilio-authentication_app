require "rails_helper"
RSpec.describe Ability, type: :model do
  describe "abilities" do
    let(:user){ FactoryGirl.create(:user) }
    subject(:ability) { Ability.new(user) }
    context "#no priviladge" do
      it{
        expect(ability.can?(:read, Product)).to be(true)
      }
      it{
        expect(ability.can?(:manage, Product)).to be(false)
      }
    end
    context "#priviladge as admin" do
      it{
        user.update_columns(role: "admin")
        ability = Ability.new(user)
        expect(ability.can?(:manage, Product)).to be(true)
      }
    end
  end
end
