class RenameRoleToBeRoleIdInUsers < ActiveRecord::Migration[5.1]
  def change
      rename_column :users, :role, :role_id
  end
end
