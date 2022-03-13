require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the TIcketsHelper. For example:
#
# describe TIcketsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe TicketsHelper, type: :helper do
  describe "format_phone_number" do
    it "reformats phone number with use prefix" do
      phone_number = '+5555555555'
      expect(format_phone_number(phone_number)).to eql('+15555555555')
    end
  end
end
