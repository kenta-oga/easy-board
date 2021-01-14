class Group < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :passcode, format: { with: /\A[0-9]+\z/ }, length: { :is => 4 }
  end

  has_many :group_users
  has_many :users, through: :group_users
end
