require 'rails_helper'

feature 'User register' do
  scenario 'successfully' do
    visit root_path

    click_link 'Registre-se'

    fill_in 'E-mail', with: 'test@company.com'
    fill_in 'Senha', with: 'password'
    fill_in 'Confirme sua senha', with: 'password'
    click_on 'Registrar'

    expect(page).to have_content('Bem vindo! Você realizou seu registro com sucesso.')
  end
end
