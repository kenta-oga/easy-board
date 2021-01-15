class Group < ApplicationRecord
  with_options presence: true, uniqueness: true do
    validates :name
  end

  has_many :group_users
  has_many :users, through: :group_users
end
