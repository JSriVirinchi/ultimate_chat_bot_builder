class Node < ApplicationRecord
	belongs_to :bot
	has_many :messages, dependent: :destroy
	acts_as_tree order: "name"
	extend ActsAsTree::TreeWalker
end