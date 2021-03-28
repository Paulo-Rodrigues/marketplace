require 'rails_helper'

feature 'User receives a notification when new order came' do
  scenario 'notifications index' do
    user = create(:user_with_profile)
    login_as(user)
    another_user = create(:user_with_profile, email: 'another@company')
    product = create(:product, user: user)
    Order.create!(product: product, seller: user, buyer: another_user, final_price: 120, status: :concluded)

    visit root_path

    click_link 'Notificações'

    expect(current_path).to eq(notifications_path)
    expect(page).to have_content('Suas notificações')
    expect(page).to have_content('Novo pedido')
    expect(page).to have_link('pedido')
  end

  scenario 'view order page' do
    user = create(:user_with_profile)
    login_as(user)
    another_user = create(:user_with_profile, email: 'another@company')
    product = create(:product, user: user)
    order = Order.create!(product: product, seller: user, buyer: another_user, final_price: 120, status: :concluded)

    visit root_path

    click_link 'Notificações'
    click_on 'pedido'

    expect(current_path).to eq(order_path(order))
    expect(page).to have_content(product.name)
  end

  scenario 'notifications number' do
    user = create(:user_with_profile)
    login_as(user)
    another_user = create(:user_with_profile, email: 'another@company')
    product = create(:product, user: user)
    Order.create!(product: product, seller: user, buyer: another_user, final_price: 120, status: :concluded)

    visit root_path

    expect(page).to have_link('Notificações 1')
  end
end
