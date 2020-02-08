class RemoveAuthorFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :profile_image, :integen
  end
end
