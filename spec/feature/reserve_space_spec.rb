require './lib/database_connection'

feature 'reserve a space' do
  scenario 'allows user to reserve' do
    DatabaseConnection.query("INSERT INTO main (user_name, place) VALUES('George', 'London');")
    visit '/'
    fill_in :username, with: 'Customer'
    click_button 'Sign in'
    click_button 'Reserve'
    click_button 'Submit'
    expect(page).to have_content 'Thank you for your reservation'
  end
end
