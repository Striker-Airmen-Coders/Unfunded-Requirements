json.extract! req, :id, :name, :title, :req_total, :group, :unit, :pec, :point_of_contact, :created_at, :updated_at
json.url req_url(req, format: :json)
