require 'rails_helper'

feature 'User suspend a product' do
  scenario 'suspended from profile page' do
    user = create(:user_with_profile); login_as(user)
    product = create(:product, user: user)

    visit profile_path(user)
    click_on 'Suspender venda'
    product.reload

    expect(product.status).to eq('suspended')
  end

  scenario 'makes available again from profile page' do
    user = create(:user_with_profile); login_as(user)
    product = create(:product, user: user, status: :suspended)

    visit profile_path(user)

    click_link 'Ativar venda'
    product.reload

    expect(product.status).to eq('available')
  end
end
