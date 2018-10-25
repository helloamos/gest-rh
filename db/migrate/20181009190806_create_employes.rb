class CreateEmployes < ActiveRecord::Migration[5.1]
  def change
    create_table :employes do |t|
      t.string :matricule, unique: true
      t.string :nom
      t.string :prenom
      t.string :sexe
      t.date :date_naissance
      t.string :lieu_naissance
      t.string :adresse
      t.string :telephone, unique: true
      t.string :email, unique: true
      t.string :situation
      t.integer :nombre_enfant
      t.string  :groupage
      t.string  :numero_cin
      t.string  :nom_diplome
      t.date  :date_obt_diplome
      t.string  :reliquat
      t.date  :date_entree


      t.timestamps
    end
  end
end
