require './lib/database_connection'

feature 'reserve a space' do
  scenario 'allows user to reserve' do
    DatabaseConnection.query("INSERT INTO main (user_name, place) VALUES('George', 'London');")
    visit '/'
    fill_in :username, with: 'Customer'
    click_button 'Sign in'
    click_button 'Reserve'
    click_button 'Confirm'
    expect(page).to have_content 'Thank you for your reservation'
  end

feature 'review reservation' do
  scenario 'user can review booking before proceeding' do
    DatabaseConnection.query("INSERT INTO main (user_name, place, description, fixed_price) VALUES ('Anna', 'Glasgow', 'great ceilidh', '100');")
    visit '/'
    fill_in :username, with: 'Customer'
    click_button 'Sign in'
    click_button 'Reserve'
    expect(page).to have_content 'Glasgow'
    expect(page).to have_content 'great ceilidh'
    expect(page).to have_content '100'
  end
end

feature 'reservation id' do
  scenario 'user gets a reservation id' do
    DatabaseConnection.query("INSERT INTO main (user_name, place, description, fixed_price) VALUES ('Anna', 'Glasgow', 'great ceilidh', '100');")
    visit '/'
    fill_in :username, with: 'Customer'
    click_button 'Sign in'
    click_button 'Reserve'
    click_button 'Confirm'
    expect(page).to have_content 'Your reservation id: '
  end
end 

end
