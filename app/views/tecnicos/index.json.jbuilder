json.array!(@tecnicos) do |tecnico|
  json.extract! tecnico, :id, :nombre
  json.url tecnico_url(tecnico, format: :json)
end
