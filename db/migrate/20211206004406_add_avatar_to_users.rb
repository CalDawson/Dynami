class AddAvatarToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :avatar_url, :string, default: "https://upload.wikimedia.org/wikipedia/commons/6/67/User_Avatar.png"
  end
end
