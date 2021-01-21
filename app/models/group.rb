class Group < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users
  has_many :posts, dependent: :destroy
end
