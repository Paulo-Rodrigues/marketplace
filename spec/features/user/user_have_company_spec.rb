require 'rails_helper'

feature 'User belongs to Company' do
  scenario 'with company name' do
    visit root_path

    click_link 'Registre-se'

    fill_in 'E-mail', with: 'test@company.com.br'
    fill_in 'Senha', with: 'password'
    fill_in 'Confirme sua senha', with: 'password'

    click_on 'Registrar'

    expect(User.last.company.name).to eq('Company')
  end
end
