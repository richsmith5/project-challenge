require "rails_helper"

RSpec.feature "Home page", :type => :feature do
  scenario "New user lands on site" do
    2.times { create(:dog) }
    visit "/"

    expect(page).to have_selector('h2', count: 2)
    expect(page).to have_link('Dog Profile', href: root_path)
    
    expect(page).to have_text("Sign in")
    expect(page).to have_text("Sign up")
  end
end
