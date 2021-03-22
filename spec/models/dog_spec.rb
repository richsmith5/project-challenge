require 'rails_helper'

RSpec.describe Dog, type: :model do

  describe "validations" do
    let(:dog) {FactoryBot.build(:dog)}

    it "should have be valid when name is present" do
        expect(dog).to be_valid
      end

    it "should have be invalid when name is nil" do
      dog.name = nil
      expect(dog).to_not be_valid
    end
  end
end

