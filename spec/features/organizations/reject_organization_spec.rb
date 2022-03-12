require 'rails_helper'

RSpec.describe 'Rejecting an organization', type: :feature do
  let(:admin) { create(:user, :admin)}
  
  before do
    admin.confirm
    log_in_as(admin)
  end

  it "allows an admin to reject a pending organization" do
    create(:organization)
    visit dashboard_path
    click_on 'Organizations'
    click_on 'Pending'
    click_on 'Review'
    fill_in 'Rejection Reason', with: 'Fake Rejection Reason'
    click_on 'Reject'
    expect(page).to have_text('has been rejected.')
  end
end
