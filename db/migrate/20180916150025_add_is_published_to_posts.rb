class AddIsPublishedToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :is_published, :boolean
  end
end
