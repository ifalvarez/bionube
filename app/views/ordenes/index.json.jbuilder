json.array!(@ordenes) do |orden|
  json.extract! orden, :solicitante, :tipoOrden, :actividadRealizada, :personaRecibe, :valor
  json.url orden_url(orden, format: :json)
end
