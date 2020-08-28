require 'rails_helper'

feature 'User login' do
  scenario 'successfully' do
    user = create(:user)
    visit root_path

    click_link 'Login'
    fill_in 'E-mail', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Login'

    expect(page).to have_content('Login efetuado com sucesso.')
  end
end
