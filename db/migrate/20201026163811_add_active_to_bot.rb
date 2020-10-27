class AddActiveToBot < ActiveRecord::Migration[6.0]
  def change
  	add_column :bots, :active, :boolean
  end
end
