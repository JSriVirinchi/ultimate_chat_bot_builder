class Message < ApplicationRecord
	belongs_to :node
	has_one_attached :image
end