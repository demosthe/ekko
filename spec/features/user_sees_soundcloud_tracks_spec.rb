require "rails_helper"

feature "User sees soundcloud tracks that belongs to him" do
  scenario "succesfully" do
    visit root_path
    expect(page).to have_content("Consecration gate")
  end
end
