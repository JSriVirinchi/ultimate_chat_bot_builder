class Bot < ApplicationRecord
	belongs_to :user
	has_many :triggerphrases, dependent: :destroy
end