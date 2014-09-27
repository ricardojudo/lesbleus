json.array!(@buses) do |bus|
  json.extract! bus, :id, :name, :bid, :route_id
  json.url bus_url(bus, format: :json)
end
