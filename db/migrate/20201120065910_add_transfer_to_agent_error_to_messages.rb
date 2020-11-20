class AddTransferToAgentErrorToMessages < ActiveRecord::Migration[6.0]
  def change
  	add_column :messages, :error_node_transfer_to_agent, :string
  	add_column :messages, :error_node_transfer_to_agent_message, :text
  end
end
