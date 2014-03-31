class InstitucionesController < ApplicationController
  before_action :set_institucion, only: [:show, :edit, :update, :destroy]
  before_action :role_required

  # GET /instituciones
  # GET /instituciones.json
  def index
    @instituciones = Institucion.all
  end

  # GET /instituciones/1
  # GET /instituciones/1.json
  def show
  end

  # GET /instituciones/new
  def new
    @institucion = Institucion.new
  end

  # GET /instituciones/1/edit
  def edit
  end

  # POST /instituciones
  # POST /instituciones.json
  def create
    @institucion = Institucion.new(institucion_params)

    respond_to do |format|
      if @institucion.save
        format.html { redirect_to @institucion, notice: 'Institucion was successfully created.' }
        format.json { render action: 'show', status: :created, location: @institucion }
      else
        format.html { render action: 'new' }
        format.json { render json: @institucion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instituciones/1
  # PATCH/PUT /instituciones/1.json
  def update
    respond_to do |format|
      if @institucion.update(institucion_params)
        format.html { redirect_to @institucion, notice: 'Institucion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @institucion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instituciones/1
  # DELETE /instituciones/1.json
  def destroy
    @institucion.destroy
    respond_to do |format|
      format.html { redirect_to instituciones_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_institucion
      @institucion = Institucion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def institucion_params
      params.require(:institucion).permit(:nombre)
    end
end
