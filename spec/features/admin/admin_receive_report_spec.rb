require 'rails_helper'

feature 'Admin receive a report on user' do
  scenario 'link to admin reports' do
    admin = create(:admin)
    login_as(admin)

    visit admin_root_path

    expect(page).to have_link('Denúncias')
  end

  scenario 'receive a report' do
    user1 = create(:user)
    user2 = create(:user_with_profile, email: 'other@company.com')
    Report.create!(reportable: user2, user: user1, reason: 'good reason')
    admin = create(:admin)
    login_as(admin)

    visit admin_root_path

    click_link 'Denúncias'

    expect(current_path).to eq(admin_reports_path)
    expect(page).to have_link(user2.name)
  end

  scenario 'admin view a report' do
    user1 = create(:user)
    user2 = create(:user_with_profile, email: 'other@company.com')
    report = Report.create!(reportable: user2, user: user1, reason: 'good reason')
    admin = create(:admin)
    login_as(admin)

    visit admin_root_path

    click_link 'Denúncias'
    click_link report.reportable.name

    expect(page).to have_content(report.reason)
    expect(page).to have_content(report.user.name)
    expect(page).to have_content(report.reportable.name)
  end
end
