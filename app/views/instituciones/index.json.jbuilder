json.array!(@instituciones) do |institucion|
  json.extract! institucion, :id, :nombre
  json.url institucion_url(institucion, format: :json)
end
