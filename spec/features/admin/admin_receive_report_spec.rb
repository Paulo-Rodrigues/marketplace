require 'rails_helper'

feature 'Admin receive a report on user' do
  scenario 'link to admin reports' do
    admin = create(:admin); login_as(admin)

    visit admin_root_path

    expect(page).to have_link('Denúncias')
  end

  xscenario 'receive a report' do
    user1 = create(:user)
    user2 = create(:user, email: 'other@company.com')
    Report.create!(reportable: user2, user: user1, reason: 'good reason')
    admin = create(:admin); login_as(admin)

    visit admin_root_path

    expect(page).to have_link('Denúncias')
  end
end
