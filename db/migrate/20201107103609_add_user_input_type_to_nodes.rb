class AddUserInputTypeToNodes < ActiveRecord::Migration[6.0]
  def change
  	add_column :nodes, :user_input_type, :string
  end
end
