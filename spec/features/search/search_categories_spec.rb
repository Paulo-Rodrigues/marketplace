require 'rails_helper'

feature 'Search Categories' do
  scenario 'links' do
    user = create(:user)
    login_as(user)
    create(:user_with_profile, email: 'other@company.com')
    categories = create_list(:categories, 3)
    visit root_path

    expect(page).to have_content(categories[0].name)
    expect(page).to have_link(categories[1].name)
    expect(page).to have_link(categories[2].name)
  end

  scenario 'links' do
    user = create(:user)
    login_as(user)
    create(:user_with_profile, email: 'other@company.com')
    categories = create_list(:categories, 3)
    visit root_path

    click_link categories[0].name

    expect(page).to have_content('Nenhum resultado para essa categoria')
  end

  scenario 'index of categories' do
    user = create(:user)
    login_as(user)
    another_user = create(:user_with_profile, email: 'other@company.com')
    category = create(:category)
    another_category = create(:category, name: 'Category B')
    product = create(:product, user: another_user, category: category)
    another_product = create(:product, name: 'another', user: another_user, category: another_category)
    visit root_path

    click_link category.name

    expect(page).to have_link(product.name)
    expect(page).not_to have_link(another_product.name)
  end

  scenario 'index of categories to product details' do
    user = create(:user)
    login_as(user)
    another_user = create(:user_with_profile, email: 'other@company.com')
    category = create(:category)
    another_category = create(:category, name: 'Category B')
    product = create(:product, user: another_user, category: category)
    create(:product, name: 'another', user: another_user, category: another_category)
    visit root_path

    click_link category.name

    click_link product.name

    expect(page).to have_content(product.name)
    expect(current_path).to eq(product_path(product))
  end
end
