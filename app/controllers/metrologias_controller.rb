class MetrologiasController < ApplicationController
  before_action :set_metrologia, only: [:show, :edit, :update, :destroy]
  before_action :set_equipo, only: [:index, :show, :edit, :update, :destroy, :new, :create]

  # GET /metrologias
  # GET /metrologias.json
  def index
    @metrologias = @equipo.metrologias
  end

  # GET /metrologias/1
  # GET /metrologias/1.json
  def show
  end

  # GET /metrologias/new
  def new
    @metrologia = Metrologia.new
  end

  # GET /metrologias/1/edit
  def edit
  end

  # POST /metrologias
  # POST /metrologias.json
  def create
    @metrologia = @equipo.metrologias.create(metrologia_params)

    respond_to do |format|
      if @metrologia.save
        format.html { redirect_to equipo_metrologias_path(@equipo), notice: 'Metrologia was successfully created.' }
        format.json { render action: 'show', status: :created, location: @metrologia }
      else
        format.html { render action: 'new' }
        format.json { render json: @metrologia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /metrologias/1
  # PATCH/PUT /metrologias/1.json
  def update
    respond_to do |format|
      if @metrologia.update(metrologia_params)
        format.html { redirect_to equipo_metrologias_path(@equipo), notice: 'Metrologia was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @metrologia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /metrologias/1
  # DELETE /metrologias/1.json
  def destroy
    @metrologia.destroy
    respond_to do |format|
      format.html { redirect_to equipo_metrologias_path(@equipo) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipo
      @equipo = Equipo.find(params[:equipo_id])
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_metrologia
      @metrologia = Metrologia.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def metrologia_params
      params.require(:metrologia).permit(:fecha, :reporte)
    end
end
