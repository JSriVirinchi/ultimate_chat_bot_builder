class CreateNodes < ActiveRecord::Migration[6.0]
  def change
    create_table :nodes do |t|
    	t.string :node_type
    	t.integer :bot_id
    	t.integer :parent_id
    end
  end
end
