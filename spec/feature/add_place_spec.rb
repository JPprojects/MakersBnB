feature "adding new place" do
  scenario "adding place" do
    visit "/add_place"
    fill_in :place, with: "Casa Amor"
    fill_in :description, with: "The House of love, for wrinkly old people with too much money"
    fill_in :fixed_price, with: "999"
    click_button "Submit"
    expect(page).to have_content("Casa Amor")
    expect(page).to have_content("The House of love, for wrinkly old people with too much money")
    expect(page).to have_content("£ 999")
  end
end
