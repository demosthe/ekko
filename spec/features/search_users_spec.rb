require "rails_helper"

feature "User can search for other users" do
  let(:user) { create :user }

  scenario "succesfully" do
    users = create_list(:user, 3)
    first_user = users.first

    login_as user
    visit search_users_path
    fill_in 'query', with: first_user.username
    click_button 'Search'
    expect(page).to have_content(first_user.email)
  end
end
