class RenameColumnRoleInUsers < ActiveRecord::Migration
  def change
    rename_column(:users, :role_code, :role_id)
  end
end
