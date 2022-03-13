require 'rails_helper'

RSpec.describe 'Deleting a Region', type: :feature do

  let(:admin) { create(:admin) }

  before do
    admin.confirm
    log_in_as(admin)
  end

  it "allows an admin to delete a region" do
    region_name = 'fake region'

    visit new_region_path
    fill_in('region_name', :with => region_name)
    click_on 'Add Region'

    visit region_path(:id => 1)
    click_on 'Delete'
    expect(page).to have_content('Region ' + region_name + ' was deleted.')
  end
end
