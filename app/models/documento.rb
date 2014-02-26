class Documento < ActiveRecord::Base
  belongs_to :equipo
  
  has_attached_file :archivo
  do_not_validate_attachment_file_type :avatar
end
