require 'rails_helper'

feature 'User initiates a order to buy a product' do
  scenario 'product has link to buy' do
    user = create(:user_with_profile)
    login_as(user)
    another_user = create(:user_with_profile, email: 'another@company.com')
    product = create(:product, user: another_user)

    visit root_path
    fill_in 'Procurar', with: product.name
    click_on 'Buscar'
    click_on product.name

    expect(page).to have_link('Comprar')
  end

  scenario 'Order page' do
    user = create(:user_with_profile)
    login_as(user)
    another_user = create(:user_with_profile, email: 'another@company.com')
    product = create(:product, user: another_user)
    order = Order.create!(product: product, buyer: user, seller: another_user)

    visit order_path(order)

    expect(current_path).to eq(order_path(order))
    expect(page).to have_content(product.name)
    expect(order.status).to eq('in_progress')
    expect(product.status).to eq('disabled')
    expect(page).to have_content('in_progress')
  end

  scenario 'Order created' do
    user = create(:user_with_profile)
    login_as(user)
    another_user = create(:user_with_profile, email: 'another@company.com')
    product = create(:product, user: another_user)

    visit root_path
    fill_in 'Procurar', with: product.name
    click_on 'Buscar'
    click_on product.name

    click_link('Comprar')

    expect(current_path).to eq('/orders/1')
    expect(page).to have_content('Espere o vendedor confirmar sua compra')
  end
end
