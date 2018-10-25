class CreateSuperAdmins < ActiveRecord::Migration[5.1]
  def change
    create_table :super_admins do |t|
      t.string :login, unique: true
      t.string :email, unique: true
      t.string :password
      t.timestamps

      t.timestamps
    end
  end
end
