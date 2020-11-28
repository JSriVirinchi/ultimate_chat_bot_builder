class AddLinkToNodeToNodes < ActiveRecord::Migration[6.0]
  def change
  	add_column :nodes, :link_to_node, :string
  	add_column :nodes, :link_to_node_message, :text
  	add_column :nodes, :toggle_link_to_node, :boolean
  end
end
