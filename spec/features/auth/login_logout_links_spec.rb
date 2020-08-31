require 'rails_helper'

feature 'Login logout links' do
    scenario 'logged user logout' do
        user = create(:user); login_as(user)
        visit root_path
        click_on 'Logout'

        expect(page).to have_content('sucesso')
    end

    scenario 'links' do
        user = create(:user); login_as(user)
        visit root_path
        
        expect(page).to have_link('Logout')
        expect(page).not_to have_link('Login')
        expect(page).not_to have_link('Registrar-se')
    end
end