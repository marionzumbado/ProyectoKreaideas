class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable+
  has_attached_file :avatar
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:email]

  # Setup accessible (or protected) attributes for your model
  	attr_accessible :email, :password, :password_confirmation, :remember_me,:name,:points,:avatar,:phone,:address
  # attr_accessible :title, :body
    #devise :database_authenticatable, :rememberable, :trackable, :authentication_keys => [:email]
    validates :phone , :numericality => {:message => "debe ser un número"}

    validates :name, :presence => {:message => "debe estar presente"} , :on => :create

    HUMANIZED_ATTRIBUTES = {
    :name => "El nombre",
    :email => "El correo",
    :phone => "El teléfono",
    :address => "La direccion",
    :password => "La contraseña",
    :points => "Los puntos",
    :password_confirmation => "La contraseña de confirmación",
    :avatar => "El avatar"
  }

    def self.human_attribute_name(attr, options={})
     HUMANIZED_ATTRIBUTES[attr.to_sym] || super
   end
    
	
end
