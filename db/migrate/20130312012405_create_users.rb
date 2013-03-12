class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :website
      t.string :bio
      t.string :twitter_handle
      t.string :email

      t.timestamps
    end
  end
end
