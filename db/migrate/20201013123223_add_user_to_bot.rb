class AddUserToBot < ActiveRecord::Migration[6.0]
  def change
  	add_column :bots, :user_id, :int, foreign_key: true
  end
end

