class OrdenesController < ApplicationController
  before_action :set_orden, only: [:show, :edit, :update, :destroy]

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
    comentario = params[:comentario].strip
    respond_to do |format|
      if @orden.save
        if comentario != ""
          comment = @orden.comments.create
          comment.comment = comentario
          comment.save
        end
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
    respond_to do |format|
      if @orden.update(orden_params)
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
    def set_orden
      @orden = Orden.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def orden_params
      params.require(:orden).permit(:solicitante, :tipoOrden, :actividadRealizada, 
          :personaRecibe, :valor, :falla, :fecha, :equipo_id)
    end
end
