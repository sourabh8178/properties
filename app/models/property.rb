class Property < ApplicationRecord
	has_many :users, dependent: :destroy
	has_many_attached :images
end
