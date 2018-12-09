class CreateSanctions < ActiveRecord::Migration[5.1]
  def change
    create_table :sanctions do |t|
      t.string :matricule_employe
      #t.string :duree_sanction
      t.date :date_debut
      t.date :date_fin
      t.text :motif
      t.string :etat


      t.references :type_sanction, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false, index: true

      t.timestamps
    end
  end
 end