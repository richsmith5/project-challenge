require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'validations' do
    let!(:user) { FactoryBot.create(:user) }

    let(:dog) { FactoryBot.build(:dog, user_id: user.id) }

    it 'should belong to the current user' do
      t = Like.reflect_on_association(:user)
      expect(t.macro).to eq(:belongs_to)
    end

    it 'should belong to a dog' do
      t = Like.reflect_on_association(:dog)
      expect(t.macro).to eq(:belongs_to)
    end
  end
end
