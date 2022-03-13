require 'rails_helper'

RSpec.describe 'Creating a Region', type: :feature do

  let(:admin) { create(:admin) }

  before do
    admin.confirm
    log_in_as(admin)
  end

end
