FactoryBot.define do
  factory :order do
    product
    status { 1 }
  end
end
