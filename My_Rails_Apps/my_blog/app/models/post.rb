class Post < ActiveRecord::Base
  belongs_to :user

  validates :title, :body, presence: true

  mount_uploader :image, ImageUploader
end
