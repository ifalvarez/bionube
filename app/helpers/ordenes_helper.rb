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
  
  def estadoOrdenHelper(estado)
    case estado
    when 1
      "Nueva"
    when 2
      "Asignada"
    when 3
      "Atendida"
    when 4
      "Recibida"
    when 5
      "Cerrada"
    end
  end
end
