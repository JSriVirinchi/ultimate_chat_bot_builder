class AddBotToTriggerphrases < ActiveRecord::Migration[6.0]
  def change
  	add_column :triggerphrases, :bot_id, :int, foreign_key: true
  end
end
