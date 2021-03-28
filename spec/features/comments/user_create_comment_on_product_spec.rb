require 'rails_helper'

feature 'User create comment on product' do
  scenario 'successfully' do
    user = create(:user)
    login_as(user)
    another_user = create(:user_with_profile, email: 'another@company.com')
    product = create(:product, user: another_user)

    visit root_path
    fill_in 'Procurar', with: product.name
    click_on 'Buscar'
    click_on product.name

    fill_in 'Deixe seu comentário', with: 'Alguma coisa'
    click_on 'Enviar comentário'

    expect(page).to have_content('Alguma coisa')
    expect(page).to have_content('Comentário enviado com sucesso')
  end
end
