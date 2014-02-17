module OrdenesHelper
  def tipoOrdenHelper(tipo)
    case tipo
    when 1
      "Mantenimiento Correctivo"
    when 2
      "Mantenimiento Prevenetivo"
    when 3
      "Metrología"
    end
  end
end
