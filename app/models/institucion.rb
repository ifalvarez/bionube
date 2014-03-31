class Institucion < ActiveRecord::Base
  has_many :equipos
  has_many :users
  
end
