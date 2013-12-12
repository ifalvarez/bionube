class User < ActiveRecord::Base
  has_many :equipos
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
         #:recoverable,  :trackable
end
