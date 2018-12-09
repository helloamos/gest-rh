class CreateMutations < ActiveRecord::Migration[5.1]
  def change
    create_table :mutations do |t|
      t.string :matricule_employe
      t.string :etablissement_origine
      t.string :etablissement_destination
      t.text :motif
      t.date :date_mutation

      t.string :etat

      t.references :user, foreign_key: true, null: false, index: true

      t.timestamps
    end
  end
end
