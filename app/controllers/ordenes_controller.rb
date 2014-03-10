class OrdenesController < ApplicationController
  before_action :set_orden, only: [:show, :edit, :update, :destroy]
  before_action :set_equipo, only: [:index, :show, :edit, :update, :new, :create]

  # GET /ordenes
  # GET /ordenes.json
  def index
    @ordenes = Orden.all
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
  end

  # POST /ordenes
  # POST /ordenes.json
  def create
    @orden = Orden.new(orden_params)
    @orden.estado = 1
    @orden.equipo_id = @equipo.id
    respond_to do |format|
      if @orden.save
        save_comment
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
    when 3
      updateParameters[:estado] = 4
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
    
    # Use callbacks to share common setup or constraints between actions.
    def set_orden
      @orden = Orden.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def orden_params
      params.require(:orden).permit(:solicitante, :tipoOrden, :actividadRealizada, 
          :personaRecibe, :valor, :falla, :fechaEjecucion, :tecnico_id, :firma)
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
