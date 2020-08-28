FactoryBot.define do
  factory :user do
    email {'test@company.com'}
    password {'password'}
    company {Company.create(name: 'Company')}
  end
end
