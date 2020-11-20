class AddErrorMessageAttributesToNodes < ActiveRecord::Migration[6.0]
  def change
  	add_column :nodes, :error_node, :string
  	add_column :nodes, :error_node_message, :text
  	add_column :nodes, :error_node_link_to_node, :string
  	add_column :nodes, :error_node_link_to_message, :text
  	add_column :nodes, :error_node_exit_message, :text
  end
end
