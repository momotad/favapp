class App < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  validates :name, presence: true
  validates :content, presence: true
  validates :genre_id, numericality: { other_than: 1, message: "can't be blank" }
end
