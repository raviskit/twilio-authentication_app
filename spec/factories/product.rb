FactoryGirl.define do
  factory :product do
    title {Faker::Name.name}
    price {Faker::Number.decimal(3)}
  end
end
