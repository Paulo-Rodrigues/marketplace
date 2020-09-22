FactoryBot.define do
  factory :user do
    sequence(:email) { |i| "test#{i}@company.com"}
    password {'password'}
    company {Company.create(name: 'Company')}

    factory :user_with_profile do
      name {"Username#{rand}"}
      surname {'Usersurname'}
      department {'Userdepartment'}
    end
  end
end
