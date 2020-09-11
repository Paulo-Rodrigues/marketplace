require 'rails_helper'

feature 'Admin root' do
  scenario 'admin view your root path' do
    admin = Admin.create!(email: 'admin@email.com', password: 'password')
    login_as(admin)

    visit admin_root_path

    expect(page).to have_content('admin page')
  end
end
