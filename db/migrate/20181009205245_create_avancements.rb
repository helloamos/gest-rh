class CreateAvancements < ActiveRecord::Migration[5.1]
  def change
    create_table :avancements do |t|
      t.string :matricule_employe
      t.date :date_avancement
      t.string :etat


      t.references :user, foreign_key: true, null: false, index: true
      
      t.timestamps
    end
  end
end
