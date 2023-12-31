class Property < ApplicationRecord
	# has_many :users, dependent: :destroy
	belongs_to :user, dependent: :destroy
	has_many :feedbacks, dependent: :destroy
	has_many_attached :images
	extend FriendlyId
  friendly_id :name, use: :slugged
  enum status_type: ["For Rent", "For Sale"]
end
