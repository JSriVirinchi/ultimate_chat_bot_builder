class AddToggleExitMessageToNodes < ActiveRecord::Migration[6.0]
  def change
  	add_column :nodes, :toggle_exit_message, :boolean
  end
end
