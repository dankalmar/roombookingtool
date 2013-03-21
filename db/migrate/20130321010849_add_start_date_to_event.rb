class AddStartDateToEvent < ActiveRecord::Migration
  def change
    add_column :events, :start_date, :string
  end
end
