class Equipo < ActiveRecord::Base
  belongs_to :user
  
  has_attached_file :avatar, styles: {medium: '300x300>'}, :default_url => ":style/gear_orange.png"
end
