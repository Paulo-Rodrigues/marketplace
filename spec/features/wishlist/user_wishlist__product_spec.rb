require 'rails_helper'

feature 'User wishlist' do
  scenario 'links' do
    user = create(:user_with_profile); login_as(user)
    another_user = create(:user_with_profile, email: 'another@company.com')
    product = create(:product, user: another_user)

    visit root_path

    click_on 'Favorite'

    expect(page).to have_link('Desfavorite')
    expect(page).not_to have_link('Favorite')
    expect(page).to have_content('favorito')
  end

  scenario 'links (only other users)' do
    user = create(:user_with_profile); login_as(user)
    product = create(:product, user: user)

    visit root_path

    expect(page).not_to have_link('Desfavorite')
    expect(page).not_to have_link('Favorite')
  end

  scenario 'links (desfavorite)' do
    user = create(:user_with_profile); login_as(user)
    another_user = create(:user_with_profile, email: 'another@company.com')
    product = create(:product, user: another_user)

    visit root_path

    click_on 'Favorite'
    click_on 'Desfavorite'

    expect(page).not_to have_link('Desfavorite')
    expect(page).to have_link('Favorite')
  end

  scenario 'favorite a product' do
    user = create(:user_with_profile); login_as(user)
    another_user = create(:user_with_profile, email: 'another@company.com')
    product = create(:product, user: another_user)

    visit root_path

    click_on 'Favorite'
    click_on 'Lista de desejos'

    expect(page).to have_content(product.name)
  end

  scenario 'unfavorite a product' do
    user = create(:user_with_profile); login_as(user)
    another_user = create(:user_with_profile, email: 'another@company.com')
    product = create(:product, user: another_user)

    visit root_path

    click_on 'Favorite'
    click_on 'Desfavorite'

    expect(user.favorites.count).to eq(0)
  end

  scenario 'products index' do
    user = create(:user_with_profile); login_as(user)
    another_user = create(:user_with_profile, email: 'another@company.com')
    product = create(:product, user: another_user)
    Favorite.create!(user: user, product: product)

    visit root_path

    click_link 'Lista de desejos'

    expect(current_path).to eq(favorites_path)
    expect(page).to have_content(product.name)
  end

  scenario 'remove products index' do
    user = create(:user_with_profile); login_as(user)
    another_user = create(:user_with_profile, email: 'another@company.com')
    product = create(:product, user: another_user)
    Favorite.create!(user: user, product: product)

    visit root_path

    click_link 'Lista de desejos'
    click_link 'Remover'

    expect(user.favorites.count).to eq(0)
  end

  scenario 'go to product details' do
    user = create(:user_with_profile); login_as(user)
    another_user = create(:user_with_profile, email: 'another@company.com')
    product = create(:product, user: another_user)
    Favorite.create!(user: user, product: product)

    visit root_path

    click_link 'Lista de desejos'

    click_on product.name

    expect(page).to have_content(product.name)
    expect(page).to have_content('favorito')
    expect(current_path).to eq(product_path(product))
  end
end
