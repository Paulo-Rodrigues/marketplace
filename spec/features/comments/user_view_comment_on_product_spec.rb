require 'rails_helper'

feature 'User view comment on product' do
  scenario 'had a comment' do
    user = create(:user)
    login_as(user)
    another_user = create(:user_with_profile, email: 'another@company.com')
    product = create(:product, user: another_user)
    Comment.create!(commentable: product, user: user, body: 'Alguma coisa')

    visit root_path
    fill_in 'Procurar', with: product.name
    click_on 'Buscar'
    click_on product.name

    expect(page).to have_content('Alguma coisa')
  end
end
