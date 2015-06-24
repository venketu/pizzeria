json.array!(@pizzarias) do |pizzaria|
  json.extract! pizzaria, :id, :name, :description, :founded, :owner, :rating
  json.url pizzaria_url(pizzaria, format: :json)
end
