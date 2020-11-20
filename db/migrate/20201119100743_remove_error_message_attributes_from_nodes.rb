class RemoveErrorMessageAttributesFromNodes < ActiveRecord::Migration[6.0]
  def change
  	remove_column :nodes, :error_node
  	remove_column :nodes, :error_node_message
  	remove_column :nodes, :error_node_link_to_node
  	remove_column :nodes, :error_node_link_to_message
  	remove_column :nodes, :error_node_exit_message
  end
end
