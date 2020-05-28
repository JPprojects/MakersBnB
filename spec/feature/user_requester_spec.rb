require 'pg'

feature 'user can successfully confirm a reservation' do
  scenario 'Click confirm button and set status to requested' do
    visit '/'
    fill_in :username, with:'Poster'
    click_button 'Sign in'
    click_button 'Add listing'
    fill_in :place, with: "Casa Amor"
    fill_in :description, with: "The House of love, for wrinkly old people with too much money"
    fill_in :fixed_price, with: "999"
    fill_in :date_from, with: "2020-05-27"
    fill_in :date_to, with: "2020-05-28"
    click_button "Submit"

    visit '/'
    fill_in :username, with:'Customer'
    click_button 'Sign in'
    click_button 'Reserve'
    click_button 'Confirm'
    expect(page).to have_content('Your request has been submitted')
    expect(page).to have_no_content 'Approve'

    visit '/'
    fill_in :username, with:'Poster'
    click_button 'Sign in'
    expect(page).to have_content 'Approve'
  end
end
