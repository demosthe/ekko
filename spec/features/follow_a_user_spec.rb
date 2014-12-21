require "rails_helper"

feature "User tries follow an user" do
  scenario "can follow another user succesfully" do
    user1 = create :user
    user2 = create :user

    login_as user1
    visit user_path user1
    click_link "Follow"

    expect(page).to have_content("You are now following #{user.username}")
  end

  scenario "cannot follow user himself" do
    user1 = create :user

    login_as user1
    visit user_path user1
    expect(page).to_not have_content("Follow")
  end
end
