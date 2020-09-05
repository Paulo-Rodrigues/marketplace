require 'rails_helper'

feature 'User confirm or cancel order' do
  scenario 'User confirm a sell' do
    user = create(:user_with_profile); login_as(user)
    another_user = create(:user_with_profile, email: 'another@company.com')
    product = create(:product, user: user)
    order = Order.create!(product: product, seller: user, buyer: another_user)

    visit order_path(order)
    click_link 'Confirmar venda'

    order.reload

    expect(order.status).to eq('concluded')
    expect(page).to have_content('Venda confirmada')
    expect(current_path).to eq(orders_path)
  end

  scenario 'User cancel a sell' do
    user = create(:user_with_profile); login_as(user)
    another_user = create(:user_with_profile, email: 'another@company.com')
    product = create(:product, user: user)
    order = Order.create!(product: product, seller: user, buyer: another_user)

    visit order_path(order)
    click_link 'Cancelar venda'

    order.reload

    expect(page).to have_content('Venda cancelada')
    expect(order.status).to eq('canceled')
    expect(current_path).to eq(orders_path)
  end

  scenario 'links to confirm or cancel order(Buyer) not appear' do
    user = create(:user_with_profile)
    another_user = create(:user_with_profile, email: 'another@company.com')
    login_as(another_user)
    product = create(:product, user: user)
    order = Order.create!(product: product, seller: user, buyer: another_user)

    visit order_path(order)

    expect(page).not_to have_link('Confirmar venda')
    expect(page).not_to have_link('Cancelar venda')
  end

  scenario 'links to confirm or cancel order(Seller)' do
    user = create(:user_with_profile);login_as(user)
    another_user = create(:user_with_profile, email: 'another@company.com')
    product = create(:product, user: user)
    order = Order.create!(product: product, seller: user, buyer: another_user)

    visit order_path(order)

    expect(page).to have_link('Confirmar venda')
    expect(page).to have_link('Cancelar venda')
  end
end
