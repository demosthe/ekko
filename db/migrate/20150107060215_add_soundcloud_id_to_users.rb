class AddSoundcloudIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :soundcloud_id, :integer
    add_index :users, :soundcloud_id
  end
end
