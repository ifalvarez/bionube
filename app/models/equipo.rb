class Equipo < ActiveRecord::Base
  belongs_to :ip
  has_many :mantenimiento_preventivos
  has_many :metrologias
  has_many :ordenes
  has_many :documentos
  
  has_attached_file :avatar, styles: {medium: '300x300>'}, :default_url => ":style/gear_orange.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
