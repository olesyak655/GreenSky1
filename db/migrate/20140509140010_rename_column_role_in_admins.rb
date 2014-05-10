class RenameColumnRoleInAdmins < ActiveRecord::Migration
  def change
    rename_column(:admins, :role_code, :role_id)
  end
end
