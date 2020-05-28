require './lib/database_connection'

feature 'reserve a space' do
  scenario 'allows user to reserve' do
    Bnb.create(place: "London", user_name:"george", description: "Good", fixed_price: "20", date_from: "2020-05-27", date_to: "2020-05-28")
    visit '/'
    fill_in :username, with: 'Customer'
    click_button 'Sign in'
    click_button 'Reserve'
    click_button 'Submit'
    expect(page).to have_content 'Thank you for your reservation'
  end
end
