class Dog < ApplicationRecord
  has_many_attached :images
  has_many :likes, dependent: :destroy

  belongs_to :users, optional: true

  paginates_per 5
  validates :name, presence: true
end
