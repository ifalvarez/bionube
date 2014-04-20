class Orden < ActiveRecord::Base
  acts_as_commentable
  belongs_to :equipo
  belongs_to :solicitante, :foreign_key => "solicitante_id", :class_name => "User"
  belongs_to :tecnico, :foreign_key => "tecnico_id", :class_name => "User"
end
