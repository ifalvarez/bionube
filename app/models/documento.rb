class Documento < ActiveRecord::Base
  belongs_to :equipo
  
  has_attached_file :archivo
end
