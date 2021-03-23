require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  describe '#create' do

    let!(:user) { FactoryBot.create(:user) }
    before { login_as user }

    let(:dog) { FactoryBot.build(:dog) }

    it 'will be allow the user to like a dog photo' do
      create(:like, user: user, dog: dog)
      expect(Like.first.user_id).to eq(user.id)
      expect(Like.first.dog_id).to eq(dog.id)
      expect(Like.all.count).to eq(1)
    end
  end
end
