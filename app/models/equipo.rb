class Equipo < ActiveRecord::Base
  belongs_to :user
  
  has_attached_file :avatar, styles: {
    medium: '300x300>'
  }
end
