class User < ApplicationRecord
  # Associate dogs with owners
  has_many :dogs, dependent: :delete_all
  has_many :likes, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # * Allow editing only by owner
  # * Allow users to like other dogs (not their own)
end
