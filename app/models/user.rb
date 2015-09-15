class User < ActiveRecord::Base


  # This has been depricated, consider newer implementation or installing the gem that supports this
  #-------------------------------------------------------------------------------------
  #
  # if Rails.env.production?
  #   attr_protected :admin
  # end
  #
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
