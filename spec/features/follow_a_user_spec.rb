require "rails_helper"

feature "User tries follow an user" do

  let(:user) { create :user }

  before(:each) do
    login_as user
  end

  scenario "can follow another user" do
    user2 = create :user

    visit user_path user2
    click_button "Follow"
    expect(page).to have_content("You are now following #{user2.username}")
  end

  context "already following user" do
    let(:user2) { create :user }

    before(:each) do
      user.follow!(user2)
    end

    scenario "cannot follow an user that he is already following" do
      visit user_path user2
      expect(page).to_not have_content("Follow")
    end

    scenario "can unfollow another user" do
      visit user_path user2
      click_button "Unfollow"
      expect(page).to have_content("You just unfollowed #{user2.username}")
      expect(user.following?(user2)).to be_nil
    end
  end

  scenario "cannot follow user himself" do
    visit user_path user
    expect(page).to_not have_content("Follow")
  end



end
