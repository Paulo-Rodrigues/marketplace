require 'rails_helper'

feature 'User view comments/response on comment on a product page' do
  scenario 'comment had comment' do
    user = create(:user); login_as(user)
    another_user = create(:user_with_profile, email: 'another@company.com')
    product = create(:product, user: another_user)
    comment = Comment.create!(commentable: product, user: user, body: 'outro')
    Comment.create!(commentable: comment, user: another_user, body: 'tréplica')

    visit root_path
    fill_in 'Procurar', with: product.name
    click_on 'Buscar'
    click_on product.name

    expect(page).to have_content('outro')
    expect(page).to have_content('tréplica')
  end
end
