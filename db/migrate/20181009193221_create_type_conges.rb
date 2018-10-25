class CreateTypeConges < ActiveRecord::Migration[5.1]
  def change
    create_table :type_conges do |t|
      t.string :name

      t.timestamps
    end
  end
end
