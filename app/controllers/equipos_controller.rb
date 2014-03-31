class EquiposController < ApplicationController
  before_action :set_equipo, only: [:show, :edit, :update, :destroy]
  before_action :checkPermissions, only: [:show, :edit, :update, :destroy]
  before_action :role_required

  # GET /equipos
  # GET /equipos.json
  def index
    @equipos = current_user.institucion.equipos
  end

  # GET /equipos/1
  # GET /equipos/1.json
  def show
    @documento = Documento.new
    
  end

  # GET /equipos/new
  def new
    @equipo = Equipo.new
  end

  # GET /equipos/1/edit
  def edit
  end

  # POST /equipos
  # POST /equipos.json
  def create
    @equipo = current_user.institucion.equipos.create(equipo_params)
    @equipo.estado = 1;
    respond_to do |format|
      if @equipo.save
        format.html { redirect_to @equipo, notice: 'El equipo fue creado exitosamente.' }
        format.json { render action: 'show', status: :created, location: @equipo }
      else
        format.html { render action: 'new' }
        format.json { render json: @equipo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equipos/1
  # PATCH/PUT /equipos/1.json
  def update
    respond_to do |format|
      if @equipo.update(equipo_params)
        format.html { redirect_to @equipo, notice: 'Equipo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @equipo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equipos/1
  # DELETE /equipos/1.json
  def destroy
    @equipo.destroy
    respond_to do |format|
      format.html { redirect_to equipos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipo
      @equipo = Equipo.find(params[:id])
    end
    
    # Check ownership of the object.
    def checkPermissions
      if @equipo.institucion != current_user.institucion
        flash[:alert] = "No tienes acceso al equipo especificado"
        redirect_to equipos_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def equipo_params
      params.require(:equipo).permit(:equipo, :marca, :modelo,
       :serie, :inventario, :tipo, :clasificacion, :avatar, :sede, :ubicacion,
       :fechaIngreso, :estado, :frecuenciaPreventivo, :frecuenciaMetrologia)
    end
end
