feature "should visit home page" do
  scenario "home page should have content" do
    visit '/'
    expect(page).to have_content "Welcome to Makers BnB"
  end
end

  feature "sign in" do
    scenario "should visit home page and see sign in field" do
      visit '/'
      expect(page).to have_field "username"
    end
  end

  feature  "Sign in button" do
    scenario "visit home page and see sign in button" do
      visit '/'
      expect(page).to have_button "Sign in"
    end
  end

  feature "Sign in button functionality" do
    scenario "visit home page and click on Sign in button" do
      visit '/'
      fill_in('username', with: 'Benjamin')
      click_button('Sign in')
      expect(page).to have_content('Welcome Benjamin!')
    end
  end
