class AddTransferToAgentFieldsToNodes < ActiveRecord::Migration[6.0]
  def change
  	add_column :nodes, :transfer_to_agent_message, :text
  	add_column :nodes, :group_transfer_to_agent, :string
  	add_column :nodes, :toggle_transfer_to_agent_message, :boolean
  end
end
