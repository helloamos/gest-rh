json.extract! type_sanction, :id, :nom, :description, :etat, :created_at, :updated_at
json.url type_sanction_url(type_sanction, format: :json)
