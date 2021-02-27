json.extract! req, :id, :name, :title, :cost, :group, :unit, :pec, :mop, :poc, :created_at, :updated_at
json.url req_url(req, format: :json)
