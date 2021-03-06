class OrdenesController < ApplicationController
  before_action :set_orden, only: [:show, :edit, :update, :destroy]
  before_action :checkPermissions, only: [:show, :edit, :update, :destroy]
  before_action :set_equipo, only: [:index, :show, :edit, :update, :new, :create]
  before_action :role_required

  # GET /ordenes
  # GET /ordenes.json
  def index
    @ordenes = Orden.joins("LEFT JOIN equipos ON equipos.id = ordenes.equipo_id where equipos.institucion_id = #{current_user.institucion.id}")
  end

  # GET /ordenes/1
  # GET /ordenes/1.json
  def show
  end

  # GET /ordenes/new
  def new
    @orden = Orden.new
  end

  # GET /ordenes/1/edit
  def edit
    if @orden.estado == 5
      render action: 'show'
    end
  end

  # POST /ordenes
  # POST /ordenes.json
  def create
    @orden = Orden.new(orden_params)
    @orden.estado = 1
    @orden.equipo_id = @equipo.id
    @orden.solicitante_id = current_user.id
    respond_to do |format|
      if @orden.save
        format.html { redirect_to @orden, notice: 'Orden was successfully created.' }
        format.json { render action: 'show', status: :created, location: @orden }
      else
        format.html { render action: 'new' }
        format.json { render json: @orden.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ordenes/1
  # PATCH/PUT /ordenes/1.json
  def update
    updateParameters = orden_params
    case (@orden.estado)
    when 1
      updateParameters[:estado] = 3
      updateParameters[:fechaEjecucion] = Date.current()
      updateParameters[:tecnico_id] = current_user.id
    when 3
      updateParameters[:estado] = 5
    end
    respond_to do |format|
      if @orden.update(updateParameters)
        save_comment
        format.html { redirect_to @orden, notice: 'Orden was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @orden.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ordenes/1
  # DELETE /ordenes/1.json
  def destroy
    @orden.destroy
    respond_to do |format|
      format.html { redirect_to ordenes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipo
      if params[:equipo_id]
        @equipo = Equipo.find(params[:equipo_id])
      elsif @orden
        @equipo = @orden.equipo
      end
    end
    
    # Check ownership of the object.
    def checkPermissions
      if @orden.equipo.institucion != current_user.institucion
        flash[:alert] = "No tienes acceso al equipo especificado"
        redirect_to equipos_path
      end
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_orden
      @orden = Orden.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def orden_params
      params.require(:orden).permit(:tipoOrden, :actividadRealizada, 
          :personaRecibe, :valor, :falla, :fechaEjecucion, :firma, :fecha_programada)
    end
    
    def save_comment
      comentario = params[:comentario].strip
        if comentario != ""
          comment = @orden.comments.create
          comment.comment = comentario
          comment.save
        end
    end
end
