json.array!(@ips) do |ip|
  json.extract! ip, :id, :name
  json.url ip_url(ip, format: :json)
end
