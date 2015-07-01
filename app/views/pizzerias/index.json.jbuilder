json.array!(@pizzerias) do |pizzeria|
  json.extract! pizzeria, :id, :name, :description, :address, :owner, :phone
  json.url pizzeria_url(pizzeria, format: :json)
end
