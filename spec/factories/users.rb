FactoryBot.define do
  factory :user do
    email {'test@company.com'}
    password {'password'}
    company {Company.create(name: 'Company')}

    factory :user_with_profile do
      name {'Username'}
      surname {'Usersurname'}
      department {'Userdepartment'}
    end
  end
end
