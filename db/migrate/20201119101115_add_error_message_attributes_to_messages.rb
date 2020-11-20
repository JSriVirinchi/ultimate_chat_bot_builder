class AddErrorMessageAttributesToMessages < ActiveRecord::Migration[6.0]
  def change
  	add_column :messages, :error_node, :string
  	add_column :messages, :error_node_message, :text
  	add_column :messages, :error_node_link_to_node, :string
  	add_column :messages, :error_node_link_to_message, :text
  	add_column :messages, :error_node_exit_message, :text
  end
end
