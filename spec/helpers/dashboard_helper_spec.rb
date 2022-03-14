require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the DashboardHelper. For example:
#
# describe DashboardHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe DashboardHelper, type: :helper do
  describe 'dashboard_for(user)' do
    it "returns admin_dashboard if user is an admin" do
      admin = double(admin?: true)
      expect(dashboard_for(admin)).to eql('admin_dashboard')
    end

    it "returns organization_submitted_dashboard if user has an organization of submitted status" do
      organization = double(submitted?: true)
      user = double(admin?: false, organization: organization)
      expect(dashboard_for(user)).to eql('organization_submitted_dashboard')
    end

    it "returns organization_approved_dashboard if user has an approved organization" do
      organization = double(submitted?: false, approved?: true)
      user = double(admin?: false, organization: organization)
      expect(dashboard_for(user)).to eql('organization_approved_dashboard')
    end

    it "returns create_application_dashboard if user doesn't have a submitted or approved organization" do
      organization = double(submitted?: false, approved?: false)
      user = double(admin?: false, organization: organization)
      expect(dashboard_for(user)).to eql('create_application_dashboard')
    end
  end
end
