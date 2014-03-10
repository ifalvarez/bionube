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
  
  def descripcionOrdenHelper(orden)
    case orden.tipoOrden
    when 1
      orden.falla
    when 2
      "Programado para #{orden.fecha_programada}"
    when 3
      "Programado para #{orden.fecha_programada}"
    end
  end
end
