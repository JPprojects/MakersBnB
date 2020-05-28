feature "adding new place" do
  scenario "adding place" do
    visit "/add_place"
    fill_in :place, with: "Casa Amor"
    fill_in :description, with: "The House of love, for wrinkly old people with too much money"
    fill_in :fixed_price, with: "999"
    fill_in :date_from, with: "2020-05-27"
    fill_in :date_to, with: "2020-05-28"
    click_button "Submit"
    expect(page).to have_content("Casa Amor")
    expect(page).to have_content("2020-05-27")
    expect(page).to have_content("2020-05-28")
  end
end
