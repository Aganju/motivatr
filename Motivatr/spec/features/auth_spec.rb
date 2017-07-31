require 'spec_helper'
require 'rails_helper'

feature "the signup process" do
  before(:each) do visit('/users/new')
  end

  scenario "has a new user page" do
    expect(page).to have_content 'New User'
  end

  feature "signing up a user" do

    scenario "shows username on the homepage after signup" do
      fill_in 'username', with: "bob"
      fill_in 'password', with: "bobspass"
      click_on "Create User"

      expect(page).to have_content 'bob'
    end

  end

end

feature "logging in" do

  before(:each) do
    visit(new_session_url)
    User.create(username: "bob", password: "bobspass")
  end

  scenario "shows username on the homepage after login" do
    fill_in 'username', with: "bob"
    fill_in 'password', with: "bobspass"
    click_on "Log In"
    expect(page).to have_content 'bob'
  end

end

feature "logging out" do
  before(:each) do
    User.create(username: "bob", password: "bobspass")
    visit(new_session_url)
    fill_in 'username', with: "bob"
    fill_in 'password', with: "bobspass"
    click_on "Log In"
  end

  scenario "begins with a logged in state" do
    expect(page).to have_button ('logout')
  end

  scenario "doesn't show username on the homepage after logout" do
    click_on "logout"
    expect(page).to_not have_button ('logout')
  end

end
