require 'rails_helper'

RSpec.describe 'Creating a Region', type: :feature do

  let(:admin) { create(:admin) }

  before do
    admin.confirm
    log_in_as(admin)
  end

  it "allows an admin to create a region" do
    region_name = 'fake region'

    visit new_region_path
    
    fill_in('region_name', :with => region_name)
    click_on 'Add Region'
    
    expect(page).to have_content(region_name)
  end
end
