require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    let!(:user) { FactoryBot.create(:user) }

    it 'should have many dogs' do
      t = User.reflect_on_association(:dogs)
      expect(t.macro).to eq(:has_many)
    end

    it 'should have many likes' do
      t = User.reflect_on_association(:likes)
      expect(t.macro).to eq(:has_many)
    end
  end
end
