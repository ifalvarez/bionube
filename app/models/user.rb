class User < ActiveRecord::Base
  # for The Role authorization
  has_role
  belongs_to :institucion
    
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
         #:recoverable,  :trackable
end
