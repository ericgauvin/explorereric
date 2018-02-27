class AddDetailsToComment < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :photo_id, :integer
    add_column :comments, :user_id, :integer
  end
end
