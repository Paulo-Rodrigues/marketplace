require 'rails_helper'

feature 'User create comments/response on comment on a product page' do
  scenario 'successfully' do
    user = create(:user); login_as(user)
    another_user = create(:user_with_profile, email: 'another@company.com')
    product = create(:product, user: another_user)
    Comment.create!(commentable: product, user: user, body: 'outro')

    visit root_path
    fill_in 'Procurar', with: product.name
    click_on 'Buscar'
    click_on product.name

    find('div#response_form').fill_in('Deixe seu comentário', with: 'Repondido')
    find('div#response_form').click_on('Enviar comentário')

    expect(page).to have_content('Comentário enviado com sucesso')
    expect(page).to have_content('outro')

  end
end
