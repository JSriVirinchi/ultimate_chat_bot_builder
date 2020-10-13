class CreateBots < ActiveRecord::Migration[6.0]
  def change
    create_table :bots do |t|
    	t.string :name
    	t.integer :phone
    	t.string :language
    	t.string :initconv
    	t.string :triggerpoint
    	t.time :starttime
    	t.time :endtime
    	t.date :startdate
    	t.date :enddate
    	t.integer :rebootconv
    	t.timestamps
    end
  end
end
