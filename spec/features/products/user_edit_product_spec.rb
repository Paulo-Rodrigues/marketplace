require 'rails_helper'

feature 'User edit a product' do
  scenario 'successfully' do
    user = create(:user_with_profile)
    login_as(user)
    product = create(:product, user: user)

    visit product_path(product)

    click_link 'Editar produto'

    fill_in 'Nome', with: 'Nome editado'
    click_on 'Enviar'

    expect(page).to have_content('Nome editado')
    expect(page).to have_content('Produto editado com sucesso')
  end
end
