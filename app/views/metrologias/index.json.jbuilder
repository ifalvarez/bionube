json.array!(@metrologias) do |metrologia|
  json.extract! metrologia, :fecha, :reporte
  json.url metrologia_url(metrologia, format: :json)
end
