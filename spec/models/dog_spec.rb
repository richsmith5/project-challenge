require 'rails_helper'

RSpec.describe Dog, type: :model do
  describe 'validations' do
    let!(:user) { FactoryBot.create(:user) }

    let(:dog) { FactoryBot.build(:dog, user_id: user.id) }

    it 'should have be valid when name is present' do
      expect(dog).to be_valid
    end

    it 'should have be invalid when name is nil' do
      dog.name = nil
      expect(dog).to_not be_valid
    end

    it 'should have be invalid when name is under two characters' do
      dog.name = 'A'
      expect(dog).to_not be_valid
    end

    it 'should belong to current user' do
      t = Dog.reflect_on_association(:users)
      expect(t.macro).to eq(:belongs_to)
    end

    it 'should have many likes' do
      t = Dog.reflect_on_association(:likes)
      expect(t.macro).to eq(:has_many)
    end
  end
end
