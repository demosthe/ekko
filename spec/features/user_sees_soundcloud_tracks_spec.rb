require "rails_helper"

feature "User sees soundcloud tracks that belongs to him" do
  let(:user) { create :user }

  scenario "succesfully" do
    skip "this is dependent on account"
    login_as user
    visit root_path
    expect(page).to have_content("Consecration gate")
  end
end
