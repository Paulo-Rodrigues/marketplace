require 'rails_helper'

feature 'User report a product' do
  scenario 'link to report' do
    user = create(:user_with_profile); login_as(user)
    another_user = create(:user_with_profile, email: 'another@company.com')
    product = create(:product, user: another_user)

    visit product_path(product)

    expect(page).to have_link('Denunciar este anúncio')
  end

  scenario 'link to report' do
    user = create(:user_with_profile); login_as(user)
    another_user = create(:user_with_profile, email: 'another@company.com')
    product = create(:product, user: another_user)

    visit product_path(product)

    click_link('Denunciar este anúncio')
    fill_in 'Motivo', with: 'bad ad'
    click_on 'Enviar'

    expect(page).to have_content('Denúncia enviada')
  end
end
