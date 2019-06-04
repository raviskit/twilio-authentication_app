FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password "password"
    password_confirmation "password"
    phone_number "8050934252"
    country_code "91"
  end
end
