class Article < ApplicationRecord
	mount_uploader :image, ImageUploader
	has_many :comments, :as => :commentable, :dependent => :destroy
	belongs_to :user
	validates :title, presence: true, length: { minimum: 3, maximum: 50 }
	validates :description, presence: true, length: { minimum: 10, maximum: 2000 }
	validates :user_id, presence: true
end
