class AddConversationToBots < ActiveRecord::Migration[6.0]
  def change
  	add_column :bots, :conversation, :string
  end
end
