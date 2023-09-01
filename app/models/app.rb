class App < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :image, presence: true
  validates :name, presence: true
  validates :content, presence: true
  validates :genre_id, numericality: { other_than: 1, message: "can't be blank" }

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[name genre_id]
  end
end
