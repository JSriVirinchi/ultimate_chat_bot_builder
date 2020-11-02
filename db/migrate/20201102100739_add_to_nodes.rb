class AddToNodes < ActiveRecord::Migration[6.0]
  def change
  	add_column :nodes, :name, :string
  	add_column :nodes, :set_next_action, :string
  	add_column :nodes, :exit_message, :text
  	add_column :nodes, :created_at, :datetime
  	add_column :nodes, :updated_at, :datetime
  end
end
