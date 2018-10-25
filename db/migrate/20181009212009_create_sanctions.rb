class CreateSanctions < ActiveRecord::Migration[5.1]
  def change
    create_table :sanctions do |t|
      t.string :matricule_employe
      t.string :duree_sanction
      t.string :type_sanction
      t.text :cause

      t.timestamps
    end
  end
end
