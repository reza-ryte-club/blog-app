class AddUsersIdToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :users_id, :integer
  end
end
