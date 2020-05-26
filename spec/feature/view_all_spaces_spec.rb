require './lib/database_connection'

feature 'all spaces' do
  scenario 'user can see all spaces' do
    DatabaseConnection.query("INSERT INTO main (user_name, place) VALUES('george', 'London');")
    DatabaseConnection.query("INSERT INTO main (user_name, place) VALUES('glen', 'Paris');")
    DatabaseConnection.query("INSERT INTO main (user_name, place) VALUES('anna', 'Berlin');")
    visit('/all')
    expect(page).to have_content 'London'
    expect(page).to have_content 'Paris'
    expect(page).to have_content 'Berlin'
  end
end
