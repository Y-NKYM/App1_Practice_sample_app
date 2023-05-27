class List < ApplicationRecord
  has_one_attached :image
  
  # バリデーション機能
  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true
end
