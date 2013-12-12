class LandingController < ApplicationController
  def index
    if current_user
      redirect_to equipos_path
    end
  end
end
