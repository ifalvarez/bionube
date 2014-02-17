class Equipo < ActiveRecord::Base
  belongs_to :user
  has_many :mantenimiento_preventivos
  has_many :metrologias
  has_many :ordenes
  
  has_attached_file :avatar, styles: {medium: '300x300>'}, :default_url => ":style/gear_orange.png"
end
