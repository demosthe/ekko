class UpdateUsernameInUsers < ActiveRecord::Migration
  change_column :users, :username, :string, default: "", null: false
end
