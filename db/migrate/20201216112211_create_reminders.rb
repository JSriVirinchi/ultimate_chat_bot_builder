class CreateReminders < ActiveRecord::Migration[6.0]
  def change
    create_table :reminders do |t|
    	t.text :reminder
	    t.integer :bot_id
	    t.integer :rebootconv
	    t.timestamps
    end
  end
end
