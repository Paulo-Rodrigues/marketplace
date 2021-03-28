FactoryBot.define do
  factory :notification do
    user { nil }
    body { 'MyText' }
  end
end
