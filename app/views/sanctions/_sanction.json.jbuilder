json.extract! sanction, :id, :matricule_employe, :duree_sanction, :type_sanction, :cause, :created_at, :updated_at
json.url sanction_url(sanction, format: :json)
