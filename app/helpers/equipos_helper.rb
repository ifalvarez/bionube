module EquiposHelper
  def tipoEquipoHelper(tipo)
    case tipo
    when 1
      "Eléctrico"
    when 2
      "Electrónico"
    when 3
      "Mecánico"
    when 4
      "Hidráulico"
    when 5
      "Neumático"
    end
  end
  
  def clasificacionEquipoHelper(clasificacion)
    case clasificacion
    when 1
      "I"
    when 2
      "IIA"
    when 3
      "IIB"
    when 4
      "III"
    end
  end
  
  def estadoEquipoHelper(estado)
    case estado
    when 1
      "Disponible"
    when 2
      "En mantenimiento"
    when 3
      "En metrología"
    when 4
      "Fuera de servicio"
    when 5  
      "Dado de baja"
    when 6
      "En demostracion"
    end
  end
end
