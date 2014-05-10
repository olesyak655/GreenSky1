class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.integer :role_code
      t.string :role_name
      t.timestamps
    end
  end
end
