class CreateAvancements < ActiveRecord::Migration[5.1]
  def change
    create_table :avancements do |t|
      t.string :matricule_employe
      t.date :date_avancement

      t.timestamps
    end
  end
end
