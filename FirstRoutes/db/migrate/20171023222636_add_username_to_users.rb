class AddUsernameToUsers < ActiveRecord::Migration[5.1]
  def up
    remove_column :users, :email
    remove_column :users, :name
    add_column :users, :username, :string, null: false
    add_index :users, :username, unique: true
  end

  def down
    remove_column :users, :username
    add_column :users, :name, :string
    add_column :users, :email, :string
  end
end
