json.array!(@devices) do |device|
  json.extract! device, :id, :name, :created_at, :update_at
  json.url device_url(device, format: :json)
end
