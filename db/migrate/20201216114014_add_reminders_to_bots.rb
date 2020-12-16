class AddRemindersToBots < ActiveRecord::Migration[6.0]
  def change
  	add_column :bots, :reminder, :string
  end
end
