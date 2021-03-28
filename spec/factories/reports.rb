FactoryBot.define do
  factory :report do
    user { nil }
    reason { 'MyText' }
    reportable { nil }
  end
end
