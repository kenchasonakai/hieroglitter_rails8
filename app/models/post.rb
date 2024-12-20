class Post < ApplicationRecord
  validates :body, presence: true, length: { maximum: 140 }

  has_many :favorites, dependent: :destroy

  mount_uploader :image, ImageUploader
end
