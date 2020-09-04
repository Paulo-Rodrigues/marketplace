require 'rails_helper'

feature 'User view a list of orders' do
  scenario 'as seller or buyer' do
    user = create(:user_with_profile); login_as(user)
    another_user = create(:user_with_profile)
    product1 = create(:product, user: another_user)
    product2 = create(:product, user: user)
    buyer_order = Order.create!(product: product1, seller: another_user, buyer: user)
    seller_order = Order.create!(product: product1, seller: user, buyer: another_user)
  end
end
