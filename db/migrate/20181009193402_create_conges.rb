class CreateConges < ActiveRecord::Migration[5.1]
  def change
    create_table :conges do |t|
      t.string :matricule_employe
      #t.string :type_conge
      t.date :date_debut
      t.date :date_fin
      t.string :motif
      t.string :etat 

      t.references :type_conge, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false, index: true
      
      t.timestamps
    end
  end
end
