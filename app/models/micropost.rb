class Micropost < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: {maximum: 255}
  
  has_many :reverses_of_favorite, class_name: "Favorite"
  has_many :favorited_user, through: :reverses_of_favorites, source: :user
  
  def favorited_user?(other_user)
    self.favorited_users.include?(other_user)
  end
end
