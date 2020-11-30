class Message < ApplicationRecord
	belongs_to :node
	has_one_attached :image
	validates :image, content_type: { in: ['image/png', 'image/jpg', 'image/jpeg'], message: 'Its is not in a proper image format.' }
end