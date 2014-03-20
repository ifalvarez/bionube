class LandingController < ApplicationController
  skip_before_filter :authenticate_user!
  def index
    if current_user
      redirect_to equipos_path
    end
  end
end
