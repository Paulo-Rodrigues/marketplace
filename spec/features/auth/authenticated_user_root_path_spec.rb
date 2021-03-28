require 'rails_helper'

feature 'Authenticated user root path' do
  scenario 'root to products index' do
    user = create(:user)
    login_as(user)

    visit root_path

    expect(page).to have_content('Produtos')
  end

  scenario 'unauthenticated user root path' do
    visit root_path

    expect(current_path).to eq(root_path)
  end
end
