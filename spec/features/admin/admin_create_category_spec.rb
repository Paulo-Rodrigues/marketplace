require 'rails_helper'

feature 'Admin create a Category' do
  scenario 'List of Categories' do
    admin = create(:admin); login_as(admin)
    categories = create_list(:categories, 3)

    visit admin_root_path

    click_link 'Categorias'

    expect(page).to have_content(categories[0].name)
    expect(page).to have_content(categories[1].name)
    expect(page).to have_content(categories[2].name)
  end

  scenario 'link to create category' do
    admin = create(:admin); login_as(admin)

    visit admin_root_path

    click_link 'Categorias'

    expect(page).to have_link('Nova categoria')
  end

  scenario 'succeessfully' do
    admin = create(:admin); login_as(admin)

    visit admin_root_path

    click_link 'Categorias'
    click_link 'Nova categoria'
    fill_in 'Nome', with: 'Nova'
    click_on 'Enviar'

    expect(page).to have_content('Nova')
  end

  scenario 'List of Categories' do
    admin = create(:admin); login_as(admin)
    categories = create_list(:categories, 3)

    visit admin_root_path

    click_link 'Categorias'
    click_link 'Nova categoria'
    fill_in 'Nome', with: 'Nova'
    click_on 'Enviar'

    expect(Category.count).to eq(4)
  end

end
