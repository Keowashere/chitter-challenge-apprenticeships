feature 'Adding a new peep' do
  scenario 'A user can add a peep to chitter' do
    visit('/peeps/new')
    fill_in('message', with: 'well hello there')
    fill_in('username', with: '@peter')
    click_button('Submit')

    expect(page).to have_content('well hello there')
  end
end
