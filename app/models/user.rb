class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, on: :create

  has_many :group_users
  has_many :groups, through: :group_users
  has_many :posts
  has_many :comments
  has_many :reads, dependent: :destroy
  has_many :readed_posts, through: :reads, source: :post

  def already_readed?(post)
    self.reads.exists?(post_id: post.id)
  end

  def unread_count(group)
    posts_count = 0
    group.posts.each do |post|
      unless self.already_readed?(post)
        posts_count += 1
      end
    end
      posts_count
  end
end
