require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe "methods" do
    let (:ticket) { build(:ticket) }

    it "returns false from the open? method if :closed is true" do
      ticket.closed = true
      expect(ticket.open?).to eq(false)
    end

    it "returns true from the open? method if :closed is false" do
      ticket.closed = true
      expect(ticket.open?).to eq(false)
      ticket.closed = false
      expect(ticket.open?).to eq(true)
    end

    it "returns true from the captured? method if organization is set" do
      expect(ticket.captured?).to eq(false)
      global_penguin_society = Organization.new
      ticket.organization = global_penguin_society
      expect(ticket.captured?).to eq(true)
    end

    it "returns false from the captured? method if organization is not set" do
      expect(ticket.captured?).to eq(false)
    end

    it "has a string representation of ticket and its id" do
      expect(ticket.to_s).to eq("Ticket ")
      ticket.id = 14
      expect(ticket.to_s).to eq("Ticket 14")
    end
  end
  
  describe "validations" do
    let(:ticket) { create(:ticket) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:region_id) }
    it { should validate_presence_of(:resource_category_id) }

    it { should validate_length_of(:name).is_at_least(1).is_at_most(255) }

    it "has a valid phone number" do
      ticket.phone = '+13215557890'
      expect(ticket).to be_valid
    end

    it "has an invalid phone number" do
      ticket.phone = "123"
      expect(ticket).to_not be_valid
    end
  end
  
  describe "associations" do
    it { should belong_to(:region) }
    it { should belong_to(:resource_category) }
  end

  describe "scopes" do
    it "open" do
      open_ticket = create(:open_ticket)
      closed_ticket = create(:closed_ticket)
      results = Ticket.open
      expect(results).to include(open_ticket)
      expect(results).to_not include(closed_ticket)
    end

    it "closed" do
      open_ticket = create(:open_ticket)
      closed_ticket = create(:closed_ticket)
      results = Ticket.closed
      expect(results).to include(closed_ticket)
      expect(results).to_not include(open_ticket) 
    end
  end
end
