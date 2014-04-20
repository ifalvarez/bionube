class CuentasController < ApplicationController
  before_action :set_cuenta, only: [:edit, :update, :destroy]
  before_action :role_required
  
  
  def index
    @cuentas = current_user.institucion.users.select{|c| c.role_id != 1 && c.role_id != 5}
  end
  
  def new
    @cuenta = User.new
  end

  # POST /resource
  def create
    @cuenta = current_user.institucion.users.create(cuenta_params)
    if @cuenta.role_id != 2 && @cuenta.role_id != 3 && @cuenta.role_id != 4
      @cuenta.role_id = 3
    end
    if @cuenta.save
      redirect_to cuentas_path, notice: 'La cuenta fue creada exitosamente.'  
    else
      render action: 'new'
    end
  end
  
  def destroy
    @cuenta.destroy
    if @cuenta.destroy
        redirect_to :back, notice: "Cuenta eliminada."
    end
  end
  
  private
    def set_cuenta
      @cuenta = User.find(params[:id])
    end
    def cuenta_params
      params.require(:user).permit(:email, :password, :password_confirmation, :role_id)
    end
end