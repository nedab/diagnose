class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,  :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  ROLES = %w[admin author user]

  after_create :assign_default_role
  
  private
  def assign_default_role
    add_role(:user)
  end
end
