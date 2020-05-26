feature "Test page" do
  scenario "should have content" do
    visit '/test'
    expect(page).to have_content "Hello world"
  end
end