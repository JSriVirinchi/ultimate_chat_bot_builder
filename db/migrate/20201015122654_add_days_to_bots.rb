class AddDaysToBots < ActiveRecord::Migration[6.0]
  def change
  	add_column :bots, :days, :string
  end
end
