class CreateTypeSanctions < ActiveRecord::Migration[5.1]
  def change
    create_table :type_sanctions do |t|
      t.string :nom
      t.text :description
      t.string :etat

      t.timestamps
    end
  end
end
