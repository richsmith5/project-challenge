require 'rails_helper'

describe 'Dog resource', type: :feature do
  let!(:user) { FactoryBot.create(:user) }
  before { login_as user }

  it 'can create a profile' do
    visit new_dog_path
    fill_in 'dog_name', with: 'Speck'
    fill_in 'dog_description', with: 'Loves to eat'
    attach_file 'dog_images', 'spec/fixtures/images/speck.jpg'
    click_button 'Submit'
    expect(Dog.count).to eq(1)
  end

  it 'can edit a dog profile' do
    dog = create(:dog, user_id: user.id)
    visit(edit_dog_path(dog))
    fill_in 'dog_name', with: 'Speck'
    click_button 'Submit'
    expect(dog.reload.name).to eq('Speck')
  end

  it 'can delete a dog profile' do
    dog = create(:dog, user_id: user.id)
    visit dog_path(dog)
    click_link "Delete #{dog.name}'s Profile"
    expect(Dog.count).to eq(0)
  end
end
