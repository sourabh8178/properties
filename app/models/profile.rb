class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :profile_image
  # validaton :name, :address, :mobile_number, presence: true
end
