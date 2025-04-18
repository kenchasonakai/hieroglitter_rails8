class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_secure_password
  has_many :sessions, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
