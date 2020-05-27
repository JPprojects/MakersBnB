require './lib/database_connection'

feature 'all spaces' do
  scenario 'user can see all spaces' do
    Bnb.create(place: "London", user_name:"george", description: "Good", fixed_price: "20", date_from: "2020-05-27", date_to: "2020-05-28")
    Bnb.create(place: "Berlin", user_name:"george", description: "Okay", fixed_price: "25", date_from: "2020-05-27", date_to: "2020-05-28")
    Bnb.create(place: "Casablanca", user_name:"george", description: "Good", fixed_price: "100", date_from: "2020-05-27", date_to: "2020-05-28")
    
    visit('/all')
    expect(page).to have_content 'London'
    expect(page).to have_content 'Berlin'
    expect(page).to have_content 'Casablanca'
    expect(page).to have_content("2020-05-27")
    expect(page).to have_content("2020-05-28")
  end
end
