require 'rails_helper'

feature 'Homepage' do
  scenario 'returns status 200 ok' do
    visit root_path

    expect(page.status_code).to eq(200)
  end

  scenario 'must have link to register' do
    visit root_path

    expect(page).to have_link('Registre-se')
  end

  scenario 'must have link to login' do
    visit root_path

    expect(page).to have_link('Login')
  end

  scenario 'redirect to register path' do
    visit root_path

    click_link 'Registre-se'

    expect(current_path).to eq(new_user_registration_path)
  end

  scenario 'redirect to login path' do
    visit root_path

    click_link 'Login'

    expect(current_path).to eq(new_user_session_path)
  end
end
