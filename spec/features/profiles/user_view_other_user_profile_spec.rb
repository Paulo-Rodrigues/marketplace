require 'rails_helper'

feature 'User view other user profile' do
  scenario 'list of users' do
    user = create(:user); login_as(user)
    other_user = create(:user, email: 'test2@company.com')
    third_user = create(:user, email: 'test3@company.com')
    other_company = create(:user, email: 'test3@other.com')

    visit root_path
    click_on 'Outros colaboradores'

    expect(page).not_to have_content(other_company.email)
    expect(page).to have_content(other_user.email)
    expect(page).to have_content(third_user.email)
  end

  scenario 'with user info' do
    user = create(:user); login_as(user)
    other_user = create(:user_with_profile, email: 'test2@company.com')

    visit root_path
    click_on 'Outros colaboradores'
    click_link 'Info'

    expect(page).to have_content(other_user.name)
    expect(page).to have_content(other_user.surname)
    expect(page).to have_content(other_user.department)
  end

  scenario 'with list of user products' do
    user = create(:user); login_as(user)
    other_user = create(:user_with_profile, email: 'test2@company.com')
    p1 = create(:product, user: other_user)
    p2 = create(:product, user: other_user)

    visit root_path
    click_on 'Outros colaboradores'
    click_link 'Info'

    expect(page).to have_content(other_user.products.first.name)
    expect(page).to have_content(other_user.products.second.name)
  end
end
