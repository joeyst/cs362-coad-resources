require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe 'full_title method' do
    it "uses base_title if page_title is empty" do
      expect(full_title).to eql('Disaster Resource Network')
    end

    it "uses base_title and page_title if page_title isn't empty" do
      expect(full_title('Fake Page Title')).to eql('Fake Page Title | Disaster Resource Network')
    end
  end
end
