require 'rails_helper'

RSpec.describe 'User registration', type: :feature do

  it "allows a guest to register as a new user" do
    email = 'fakeemail@fakemail.com'
    password = 'password1234'
    
    visit signup_path
    
    fill_in('user_email', :with => email)
    fill_in('user_password', :with => password)
    fill_in('user_password_confirmation', :with => password)

    click_button('Sign up')

    expect(page).to have_content('A message with a confirmation link has been sent to your email address.')
  end

  it "does not allow a guest to register without filling credentials" do
    email = 'fakeemail@fakemail.com'
    password = 'password1234'
    
    visit signup_path
    
    fill_in('user_email', :with => email)
    fill_in('user_password', :with => password)
    fill_in('user_password_confirmation', :with => password + 'abc')

    click_button('Sign up')

    expect(page).to have_content("Password confirmation doesn't match")
  end

  it "does not allow a guest to register if passwords do not match" do
    visit signup_path
    click_button('Sign up')
    
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password can't be blank")
  end
end
