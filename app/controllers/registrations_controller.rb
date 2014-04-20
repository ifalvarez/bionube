class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    build_resource(sign_up_params)
    if params[:institucion] != ''
      nombre = params[:institucion]
    else
      nombre = "Mi Institucion"
    end
    @institucion = Institucion.new(:nombre => nombre)
    if @institucion.save
      resource.institucion_id = @institucion.id
      resource.role_id = 5
      if resource.save
        yield resource if block_given?
        
        if resource.active_for_authentication?
          sign_up(resource_name, resource)
          respond_with resource, :location => after_sign_up_path_for(resource)
        else
          set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
          expire_data_after_sign_in!
          respond_with resource, :location => after_inactive_sign_up_path_for(resource)
        end
      else
        clean_up_passwords resource
        respond_with resource
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  def update
    super
  end
end 