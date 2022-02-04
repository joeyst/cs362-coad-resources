require 'rails_helper'

RSpec.describe Organization, type: :model do

  let(:organization) { build(:organization) }

  describe "attributes" do
    it "has agreement_one" do
      expect(organization).to respond_to(:agreement_one)
    end
    it "has agreement_two" do
      expect(organization).to respond_to(:agreement_two)
    end
    it "has agreement_three" do
      expect(organization).to respond_to(:agreement_three)
    end
    it "has agreement_four" do
      expect(organization).to respond_to(:agreement_four)
    end
    it "has agreement_five" do
      expect(organization).to respond_to(:agreement_five)
    end
    it "has agreement_six" do
      expect(organization).to respond_to(:agreement_six)
    end
    it "has agreement_seven" do
      expect(organization).to respond_to(:agreement_seven)
    end
    it "has agreement_eight" do
      expect(organization).to respond_to(:agreement_eight)
    end
  end



end
