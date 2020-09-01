require 'rails_helper'

feature 'User search for a product' do
  scenario 'successfully' do
    other_user = create(:user_with_profile)
    product = create(:product, user: other_user)
    user = create(:user, email: 'me@company.com'); login_as(user)
    visit root_path
    
    fill_in 'Procurar', with: product.name
    click_on 'Buscar'

    expect(page).to have_content(product.name)
  end

  scenario 'with details' do
    other_user = create(:user_with_profile)
    product = create(:product, user: other_user)
    user = create(:user, email: 'me@company.com'); login_as(user)
    visit root_path
    
    fill_in 'Procurar', with: product.name
    click_on 'Buscar'
    click_on product.name

    expect(current_path).to eq(product_path(product))
  end

  scenario 'successfully' do
    other_user = create(:user_with_profile)
    product = create(:product, user: other_user)
    user = create(:user, email: 'me@company.com'); login_as(user)
    visit root_path
    
    fill_in 'Procurar', with: 'Bad Name'
    click_on 'Buscar'

    expect(page).not_to have_content(product.name)
    expect(page).to have_content('Produto não encontrado')
  end

end
