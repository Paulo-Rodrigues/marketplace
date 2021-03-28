require 'rails_helper'

feature 'User report other user' do
  scenario 'link to report' do
    user = create(:user_with_profile)
    login_as(user)
    another_user = create(:user_with_profile, email: 'other@company.com')

    visit profile_path(another_user)

    expect(page).to have_link('denunciar usuário')
  end

  scenario 'user report other user' do
    user = create(:user_with_profile)
    login_as(user)
    another_user = create(:user_with_profile, email: 'other@company.com')

    visit profile_path(another_user)

    click_link 'denunciar usuário'
    fill_in 'Motivo', with: 'Bom motivo'
    click_on 'Enviar'

    expect(page).to have_content('Denúncia enviada')
  end

  scenario 'link not show if user previously reportd other user' do
    user = create(:user_with_profile)
    login_as(user)
    another_user = create(:user_with_profile, email: 'other@company.com')

    visit profile_path(another_user)

    click_link 'denunciar usuário'
    fill_in 'Motivo', with: 'Bom motivo'
    click_on 'Enviar'

    visit profile_path(another_user)

    expect(page).not_to have_link('denunciar usuário')
  end

  scenario 'current_user cant see your own report link' do
    user = create(:user_with_profile)
    another_user = create(:user_with_profile, email: 'other@company.com')
    login_as(another_user)
    Report.create!(user: user, reportable: another_user, reason: 'Bad')

    visit profile_path(another_user)

    expect(page).not_to have_link('denunciar usuário')
  end
end
