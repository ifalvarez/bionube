class IndicadoresController < ApplicationController
  
  # GET /indicadores
  # GET /indicadores.json
  def index
    if current_user
      @costoMensual = {"Enero" => 5600000, "Febrero" => 2400000, "Marzo" => 20560000, "Abril" => 17980000,
        "Mayo" => 18500000, "Junio" => 12000000}
      @respuestosUtilizados = {"Enero" => 100, "Febrero" => 300, "Marzo" => 230, "Abril" => 400,
        "Mayo" => 600, "Junio" => 550}
      @tiempoDeReparacion = {"Enero" => 3, "Febrero" => 5, "Marzo" => 4, "Abril" => 2,
        "Mayo" => 6, "Junio" => 5}
      @indiceDeMantencion = {}
      @atendidosCorrectivo = {}
      @atendidosPreventivo = {}
     
      
    else
      flash[:alert] = "Debe ingresar para ver sus equipos"
      redirect_to root_path
    end
  end
end
