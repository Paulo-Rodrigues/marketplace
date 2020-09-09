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

  scenario 'link to report not showed' do
    user = create(:user_with_profile); login_as(user)
    another_user = create(:user_with_profile, email: 'another@company.com')
    product = create(:product, user: another_user)

    visit product_path(product)

    click_link('Denunciar este anúncio')
    fill_in 'Motivo', with: 'bad ad'
    click_on 'Enviar'
    visit product_path(product)

    expect(page).not_to have_link('Denunciar este anúncio')
  end

  scenario 'product with 3 reports got suspended' do
    user1 = create(:user_with_profile)
    user2 = create(:user_with_profile, email: 'user2@company.com')
    user3 = create(:user_with_profile, email: 'user3@company.com')
    another_user = create(:user_with_profile, email: 'another@company.com')
    product = create(:product, user: another_user)

    [user1, user2, user3].each do |user|
      Report.create!(reason: 'Reasom x', reportable: product, user: user)
    end

    product.reload
    expect(product.status).to eq('suspended')
  end
end
