class MantenimientoPreventivosController < ApplicationController
  before_action :set_mantenimiento_preventivo, only: [:show, :edit, :update, :destroy]
  before_action :set_equipo, only: [:index, :show, :edit, :update, :destroy, :new, :create]

  # GET /mantenimiento_preventivos
  # GET /mantenimiento_preventivos.json
  def index
    @mantenimiento_preventivos = @equipo.mantenimiento_preventivos
  end

  # GET /mantenimiento_preventivos/1
  # GET /mantenimiento_preventivos/1.json
  def show
  end

  # GET /mantenimiento_preventivos/new
  def new
    @mantenimiento_preventivo = MantenimientoPreventivo.new
  end

  # GET /mantenimiento_preventivos/1/edit
  def edit
  end

  # POST /mantenimiento_preventivos
  # POST /mantenimiento_preventivos.json
  def create
    @mantenimiento_preventivo = @equipo.mantenimiento_preventivos.create(mantenimiento_preventivo_params)

    respond_to do |format|
      if @mantenimiento_preventivo.save
        format.html { redirect_to equipo_mantenimiento_preventivos_path(@equipo), notice: 'Mantenimiento preventivo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @mantenimiento_preventivo }
      else
        format.html { render action: 'new' }
        format.json { render json: @mantenimiento_preventivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mantenimiento_preventivos/1
  # PATCH/PUT /mantenimiento_preventivos/1.json
  def update
    respond_to do |format|
      if @mantenimiento_preventivo.update(mantenimiento_preventivo_params)
        format.html { redirect_to equipo_mantenimiento_preventivos_path(@equipo), notice: 'Mantenimiento preventivo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mantenimiento_preventivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mantenimiento_preventivos/1
  # DELETE /mantenimiento_preventivos/1.json
  def destroy
    @mantenimiento_preventivo.destroy
    respond_to do |format|
      format.html { redirect_to equipo_mantenimiento_preventivos_path(@equipo) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipo
      @equipo = Equipo.find(params[:equipo_id])
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_mantenimiento_preventivo
      @mantenimiento_preventivo = MantenimientoPreventivo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mantenimiento_preventivo_params
      params.require(:mantenimiento_preventivo).permit(:fecha, :reporte)
    end
end
