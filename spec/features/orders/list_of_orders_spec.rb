require 'rails_helper'

feature 'User view a list of orders' do
  scenario 'as seller or buyer' do
    user = create(:user_with_profile); login_as(user)
    another_user = create(:user_with_profile, email: 'another@company.com')
    third_user = create(:user_with_profile, email: 'third@company.com')
    product1 = create(:product, user: another_user)
    product2 = create(:product, user: user)
    product3 = create(:product, name: 'Third', user: another_user)
    buyer_order = Order.create!(product: product1, seller: another_user, buyer: user)
    seller_order = Order.create!(product: product1, seller: user, buyer: another_user)
    third_buyer = Order.create!(product: product3, seller: another_user, buyer: third_user)

    visit root_path
    click_link 'Minhas compras e vendas'

    expect(page).to have_content(buyer_order.product.name)
    expect(page).to have_content(seller_order.product.name)
    expect(page).not_to have_content(third_buyer.product.name)
  end

  scenario 'with details' do
    user = create(:user_with_profile); login_as(user)
    another_user = create(:user_with_profile, email: 'another@company.com')
    product1 = create(:product, user: another_user)
    product2 = create(:product, user: user)
    buyer_order = Order.create!(product: product1, seller: another_user, buyer: user)
    seller_order = Order.create!(product: product1, seller: user, buyer: another_user)

    visit root_path
    click_link 'Minhas compras e vendas'
    click_link buyer_order.product.name, match: :first

    expect(current_path).to eq('/orders/1')
    expect(page).to have_content(product1.name)
  end
end
