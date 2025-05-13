class Post < ApplicationRecord
  validates :body, presence: true, length: { maximum: 140 }
  validates :translated_text, length: { maximum: 255 }

  has_many :favorites, dependent: :destroy

  mount_uploader :ogp_image, OgpImageUploader
  mount_uploader :image, ImageUploader
end
