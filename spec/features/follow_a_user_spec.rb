require "rails_helper"

feature "User tries follow an user" do

  let(:user) { create :user }

  scenario "can follow another user" do
    user2 = create :user

    login_as user
    visit user_path user2
    click_button "Follow"
    expect(page).to have_content("You are now following #{user2.username}")
  end

  scenario "can unfollow another user" do
    skip
    user2 = create :user
  end

  scenario "cannot follow user himself" do
    login_as user
    visit user_path user
    expect(page).to_not have_content("Follow")
  end

  scenario "cannot follow an user that he is already following" do
    user2 = create :user
    user.follow!(user2)

    login_as user
    visit user_path user2
    expect(page).to_not have_content("Follow")
  end


end
