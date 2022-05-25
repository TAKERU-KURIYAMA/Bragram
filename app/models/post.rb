class Post < ApplicationRecord
  has_one_attached :image
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :rares, dependent: :destroy
  has_many :wonderfuls, dependent: :destroy
  belongs_to :user
  
  validates :title, presence: true
  validates :body, presence: true
  

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def rared_by?(user)
    rares.exists?(user_id: user.id)
  end

  def wonderfuled_by?(user)
    wonderfuls.exists?(user_id: user.id)
  end
end
