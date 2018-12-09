class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.string :nom
      t.string :telephone
      t.string :etat

 	t.references :user, foreign_key: true, null: false, index: true
      t.timestamps
    end
  end
end
