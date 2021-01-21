class Post < ApplicationRecord
  belongs_to :group
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :content, unless: :was_attached?
  end

  def was_attached?
    image.attached?
  end
end
