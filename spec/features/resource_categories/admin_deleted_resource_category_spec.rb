require 'rails_helper'

RSpec.describe 'Deleting a Resource Category', type: :feature do

  let(:admin) { create(:admin) }

  before do
    admin.confirm
    log_in_as(admin)
  end

  it "allows an admin to delete a resource category" do
    visit new_resource_category_path
    resource_category_name = 'fake category'
    fill_in('resource_category_name', :with => resource_category_name)
    click_on 'Add resource category'

    visit resource_category_path(:id => 1)
    click_on 'Delete'
    expect(page).to have_content('Category ' + resource_category_name + ' was deleted.')
  end
end
