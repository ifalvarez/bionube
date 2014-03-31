class DocumentosController < ApplicationController
  before_action :set_documento, only: [:show, :edit, :update, :destroy]
  before_action :checkPermissions, only: [:show, :edit, :update, :destroy]
  before_action :set_equipo, only: [:show, :edit, :update, :destroy, :new, :create]

  # GET /documentos/1
  # GET /documentos/1.json
  def show
  end

  # GET /documentos/new
  def new
    @documento = Documento.new
  end

  # GET /documentos/1/edit
  def edit
  end

  # POST /documentos
  # POST /documentos.json
  def create
    @documento = @equipo.documentos.create(documento_params)
    
    respond_to do |format|
      if @documento.save
        format.html { redirect_to @equipo, notice: 'Documento was successfully created.' }
      else
        format.html { render action: 'equipos/show' }
      end
    end
  end

  # PATCH/PUT /documentos/1
  # PATCH/PUT /documentos/1.json
  def update
    respond_to do |format|
      if @documento.update(documento_params)
        format.html { redirect_to @equipo, notice: 'Documento was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @documento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documentos/1
  # DELETE /documentos/1.json
  def destroy
    @documento.destroy
    respond_to do |format|
      format.html { redirect_to @equipo }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipo
      @equipo = Equipo.find(params[:equipo_id])
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_documento
      @documento = Documento.find(params[:id])
    end
    
    # Check ownership of the object.
    def checkPermissions
      if @documento.equipo.institucion != current_user.institucion
        flash[:alert] = "No tienes acceso al equipo especificado"
        redirect_to equipos_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def documento_params
      params.require(:documento).permit(:archivo)
    end
end
