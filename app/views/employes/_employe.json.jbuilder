json.extract! employe, :id, :matricule, :nom, :prenom, :sexe, :date_naissance, :lieu_naissance, :adresse, :telephone, :created_at, :updated_at
json.url employe_url(employe, format: :json)
