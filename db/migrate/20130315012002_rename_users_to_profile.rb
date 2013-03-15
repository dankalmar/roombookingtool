class RenameUsersToProfile < ActiveRecord::Migration
  def up
  	rename_table :users, :profiles
  end

  def down
  	rename_table :profiles, :users
  end
end
