require 'rails_helper'

RSpec.describe 'Deleting a Region', type: :feature do

  let(:admin) { create(:admin) }

  before do
    admin.confirm
    log_in_as(admin)
  end

  it "allows an admin to delete a region" do
  end
end
