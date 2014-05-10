class AddRoleIdColumnToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :role_code, :integer
  end
end
