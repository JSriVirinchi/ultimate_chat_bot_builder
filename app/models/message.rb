class Message < ApplicationRecord
	belongs_to :node
	has_one_attached :image
	has_one_attached :video
	has_one_attached :pdf
	validates :image, content_type: { in: ['image/png', 'image/jpg', 'image/jpeg'], message: 'Its is not in a proper image format.' }
	validates :video, content_type: { in: ['video/mp4'], message: 'Its is not in a proper video format.' }
	validates :pdf, content_type: { in: ['application/pdf'], message: 'Its is not in a proper pdf format.' }
end