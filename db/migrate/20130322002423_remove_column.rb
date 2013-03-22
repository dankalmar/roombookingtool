class RemoveColumn < ActiveRecord::Migration
  def up
  	remove_column :events, :start_date
  	remove_column :events, :start_time
  	remove_column :events, :end_date
  	remove_column :events, :end_time
  end

  def down
  	add_column :events, :start_date, :string
  	add_column :events, :start_time, :string
  	add_column :events, :end_date, :string
  	add_column :events, :end_time, :string
  end
end
