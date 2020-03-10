class RenameProfileImageIdColumnToBookComments < ActiveRecord::Migration[5.2]
  def change
  	rename_column :book_comments, :profile_image_id, :book_id
  end
end
