json.array!(@mantenimiento_preventivos) do |mantenimiento_preventivo|
  json.extract! mantenimiento_preventivo, :fecha, :reporte
  json.url mantenimiento_preventivo_url(mantenimiento_preventivo, format: :json)
end
