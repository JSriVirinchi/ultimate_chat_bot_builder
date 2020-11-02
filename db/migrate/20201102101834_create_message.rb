class CreateMessage < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
    	t.text :text_messages
    	t.string :node_type
    	t.integer :bot_id
    	t.integer :node_id
    	t.timestamps
    end
  end
end
