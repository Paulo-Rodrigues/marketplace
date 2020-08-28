require 'rails_helper'

feature 'User view products from the same company employees' do
  scenario 'must be logged in' do
    visit products_path

    expect(current_path).to eq(new_user_session_path)
  end

  scenario 'list of products of same company' do
    employee1 = create(:user_with_profile)
    employee2 = create(:user_with_profile, email: 'test2@company.com')
    employee1_products = create(:product, user: employee1)
    employee2_products = create(:product, user: employee2)
    user = create(:user, email: 'testuser@company.com'); login_as(user)

    visit products_path

    expect(page).to have_content(employee1_products.name)
    expect(page).to have_content(employee2_products.name)
  end

  scenario 'only products of the same company' do
    employee1 = create(:user_with_profile)
    employee2 = create(:user_with_profile, email: 'test2@company.com')
    employee3 = create(:user_with_profile, email: 'test2@othercompany.com')
    employee1_products = create(:product, user: employee1)
    employee2_products = create(:product, user: employee2)
    employee3_products = create(:product, name: 'Not appear', user: employee3)
    user = create(:user, email: 'testuser@company.com'); login_as(user)

    visit products_path

    expect(page).not_to have_content(employee3_products.name)
    expect(page).to have_content(employee1_products.name)
    expect(page).to have_content(employee2_products.name)
  end
end
