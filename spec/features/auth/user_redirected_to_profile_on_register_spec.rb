require 'rails_helper'

feature 'User redirected to profile on registering' do
  scenario 'successfully' do
    visit root_path
    click_on 'Registre-se'
    fill_in 'E-mail', with: 'test@test.com'
    fill_in 'Senha', with: 'password'
    fill_in 'Confirme sua senha', with: 'password'
    click_on 'Registrar'

    expect(page).to have_link('Edite seu perfil')
    expect(current_path).to eq(profile_path(1))
  end

  scenario 'edit user info' do
    visit root_path
    click_on 'Registre-se'
    fill_in 'E-mail', with: 'test@test.com'
    fill_in 'Senha', with: 'password'
    fill_in 'Confirme sua senha', with: 'password'
    click_on 'Registrar'
    click_on 'Edite seu perfil'

    fill_in 'Nome', with: 'User name'
    fill_in 'Sobrenome', with: 'User surname'
    fill_in 'Departamento', with: 'User department'
    fill_in 'Senha atual', with: 'password'
    click_on 'Editar'

    expect(current_path).to eq(profile_path(1))
    expect(page).to have_content('User name')
    expect(page).to have_content('User surname')
    expect(page).to have_content('User department')
  end

  scenario 'only authenticated users' do
    user = create(:user)
    visit profile_path(user)

    expect(current_path).to eq(new_user_session_path)
  end

  scenario 'only user with full profile info can buy or sell (message)' do
    user = create(:user); login_as(user)
    visit profile_path(user)

    expect(page).to have_content('Apenas usuários com o perfil completo podem comprar ou vender')
  end
end
