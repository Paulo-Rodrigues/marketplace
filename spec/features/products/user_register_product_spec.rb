require 'rails_helper'

feature 'User register product' do
  scenario 'must have full profile' do
    user = create(:user); login_as(user)
    visit root_path
    
    click_on 'Anuncie um produto'

    fill_in 'Nome', with: 'My Product'
    fill_in 'Descrição', with: 'Product description'

    click_on 'Enviar'

    expect(page).to have_content('Cadastre um produto')
  end

  scenario 'have link to new product' do
    user = create(:user_with_profile); login_as(user)
    visit root_path

    expect(page).to have_link('Anuncie um produto')
  end

  scenario 'successfully' do
    user = create(:user_with_profile); login_as(user)
    visit root_path
    
    click_on 'Anuncie um produto'

    fill_in 'Nome', with: 'My Product'
    fill_in 'Descrição', with: 'Product description'
    fill_in 'Preço', with: 10

    click_on 'Enviar'

    expect(page).to have_content('My Product')
    expect(page).to have_content('Product description')
  end

  scenario 'successfully with image' do
    user = create(:user_with_profile); login_as(user)
    visit root_path
    
    click_on 'Anuncie um produto'

    attach_file 'Imagem', Rails.root.join('spec/fixtures/files/image.jpg')
    fill_in 'Nome', with: 'My Product'
    fill_in 'Descrição', with: 'Product description'
    fill_in 'Preço', with: 10

    click_on 'Enviar'

    expect(page).to have_css("img")
    expect(page).to have_content('My Product')
    expect(page).to have_content('Product description')
  end

  scenario 'error messages' do
    user = create(:user_with_profile); login_as(user)
    visit root_path
    
    click_on 'Anuncie um produto'

    fill_in 'Nome', with: ''
    fill_in 'Descrição', with: ''
    fill_in 'Preço', with: ''

    click_on 'Enviar'

    expect(page).to have_content('não pode ficar em branco', count: 3 )
  end
end
