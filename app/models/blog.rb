class Blog < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :favorites, dependent: :destroy
end
