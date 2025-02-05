require 'rails_helper'

RSpec.describe 'Logging in', type: :feature do
  
  let (:user) { create(:user) }
  
  before do
    user.confirm
  end

  it "allows a guest to log in" do
    visit login_path

    fill_in('user_email', :with => user.email)
    fill_in('user_password', :with => user.password)
    check('user_remember_me')

    click_on('Sign in')

    expect(page).to have_content('Signed in successfully.')
  end

  it "does not allow a guest to log in with invalid credentials" do
    visit login_path

    fill_in('user_email', :with => 'invalid')
    fill_in('user_password', :with => 'alsoinvalid')
    check('user_remember_me')

    click_on('Sign in')
    expect(page).to have_content('Invalid Email or password.')
  end
end
