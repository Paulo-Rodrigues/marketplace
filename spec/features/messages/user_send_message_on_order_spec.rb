require 'rails_helper'

feature 'User send message on order' do
  scenario 'send message' do
    user = create(:user_with_profile); login_as(user)
    another_user = create(:user_with_profile, email: 'another@company.com')
    product = create(:product, user: another_user)
    order = Order.create!(product: product, buyer: user, seller: another_user)

    visit order_path(order)
    fill_in 'Sua mensagem', with: 'Minha mensagem'
    click_on 'Enviar mensagem'

    expect(page).to have_content('Minha mensagem')
    expect(page).to have_content('Mensagem enviada com sucesso')
  end

  scenario 'view message' do
    user = create(:user_with_profile); login_as(user)
    another_user = create(:user_with_profile, email: 'another@company.com')
    product = create(:product, user: another_user)
    order = Order.create!(product: product, buyer: user, seller: another_user)
    message = Message.create!(text: 'My message', user: user, order: order)

    visit order_path(order)

    expect(page).to have_content(message.text)
  end

  scenario 'view message(another user)' do
    user = create(:user_with_profile); login_as(user)
    another_user = create(:user_with_profile, email: 'another@company.com')
    product = create(:product, user: another_user)
    order = Order.create!(product: product, buyer: user, seller: another_user)
    message = Message.create!(text: 'My other message', user: another_user, order: order)

    visit order_path(order)

    expect(page).to have_content(message.text)
  end
end
