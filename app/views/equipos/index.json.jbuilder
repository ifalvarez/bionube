json.array!(@equipos) do |equipo|
  json.extract! equipo, :equipo, :marca, :modelo, :serie, :inventario, :tipo, :clasificacion
  json.url equipo_url(equipo, format: :json)
end
