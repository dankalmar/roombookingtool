class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :title
      t.text :user
      t.string :description
      t.text :time

      t.timestamps
    end
  end
end
