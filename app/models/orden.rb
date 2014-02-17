class Orden < ActiveRecord::Base
  acts_as_commentable
  belongs_to :equipo
end
