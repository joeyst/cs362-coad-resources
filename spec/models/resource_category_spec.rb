require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
    describe "validations" do 
        let (:resource_category) { ResourceCategory.new }
        it "has a name" do
            expect(resource_category).to_not be_valid
            expect(resource_category).to validate_presence_of(:name)
            resource_category.name = 'resource category'
            expect(resource_category).to be_valid
        end

        it "cannot have a blank name" do
            expect(resource_category).to_not be_valid
            expect(resource_category).to validate_presence_of(:name)
        end

        it "has a valid name when length 1 or greater" do
            expect(resource_category).to_not be_valid
            resource_category.name = ''
            expect(resource_category).to_not be_valid
            resource_category.name = 'a'
            expect(resource_category).to be_valid
        end

        it "has a valid name when length 255 or lower" do
            expect(resource_category).to_not be_valid
            resource_category.name = 'a' * 256
            expect(resource_category).to_not be_valid
            resource_category.name = 'a'
            expect(resource_category).to be_valid
        end

        it "has a unique name" do
            resource_category_1 = ResourceCategory.create!(name: 'a')
            resource_category_2 = ResourceCategory.new(name: 'ab')
            expect(resource_category_2).to be_valid
            resource_category_2.name = 'a'
            expect(resource_category_2).to_not be_valid
        end
    end
end
