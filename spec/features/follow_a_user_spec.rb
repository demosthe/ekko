require "rails_helper"

feature "User can follow another user" do
  scenario "successfully" do
    user1 = create :user
    user2 = create :user

    login_as user1
    visit user_path user2
    click_link "Follow"

    expect(page).to have_content("You are now following #{user.username}")
  end
end
