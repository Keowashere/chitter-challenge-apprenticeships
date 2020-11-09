feature 'Viewing peeps' do
  scenario'A user can see the bookmarks' do
    connection = PG.connect(dbname: 'chitter_test')

    visit('/peeps')

    expect(page).to have_content 'This is a peep!'

  end
end
