FactoryBot.define do
  factory :product do
    name { "Product" }
    description { "Product description" }
    user 
    company {user.company}
  end
end
