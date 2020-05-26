feature "should visit home page" do
  scenario "home page should have content" do 
    visit '/'
    expect(page).to have_content "Welcome to Makers BnB"
  end

  feature "sign in" do
    scenario "should visit home page and see sign in field" do 
      visit '/'
      expect(page).to have_field "user_name"
    end

    scenario "visit home page and see sign in button" do
      visit '/'
      expect(page).to have_button "Sign in"
    end
  end 
end