class CreateDemissions < ActiveRecord::Migration[5.1]
  def change
    create_table :demissions do |t|
      t.date :date_demission
      t.string :matricule_employe
      t.string :etat
      t.references :user, foreign_key: true, null: false, index: true

      t.timestamps
    end
  end
end
