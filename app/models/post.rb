class Post < ApplicationRecord
  belongs_to :group
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :content, unless: :was_attached?
  end

  def was_attached?
    self.image.attached?
  end
  
end
