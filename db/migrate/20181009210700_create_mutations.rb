class CreateMutations < ActiveRecord::Migration[5.1]
  def change
    create_table :mutations do |t|
      t.string :matricule_employe
      t.string :etablissement
      t.text :cause
      t.date :date_mutation

      t.timestamps
    end
  end
end
