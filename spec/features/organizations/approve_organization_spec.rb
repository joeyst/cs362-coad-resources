require 'rails_helper'

RSpec.describe 'Approving an organization', type: :feature do
  let(:admin) { create(:user, :admin)}

  before do
    admin.confirm
    log_in_as(admin)
  end

  it "allows admin to approve an organization" do
    create(:organization)
    click_on 'Organizations'
    click_on 'Pending'
    click_on 'Review'
    click_on 'Approve'
    expect(page).to have_text('has been approved.')
  end
end
