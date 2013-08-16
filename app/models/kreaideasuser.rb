
require 'digest/sha2'
class Kreaideasuser < ActiveRecord::Base
	attr_accessible :address, :addresslevel1_id, :email, :hashed_password, :name, :phone, :points,:password,:password_confirmation,:country_id

	validates :name,:email,:phone,:points,:address,:password,:password_confirmation, :presence => {:message => "debe estar presente"} 
	validates :email, :uniqueness => {:message => "ya esta en uso"}
	validates :password, :confirmation => {:message => "debe ser la misma la contraseña de confirmación"}
	validates :phone , :numericality => {:message => "debe ser un número"}
	validates :email, :format => {:with => %r{\A[\w\.]+@\w+\.[A-Za-z]+\z}, :message => 'ingresado no es un formato válido'}


	attr_accessor :password_confirmation
	attr_reader :password
	validate :password_must_be_present => {:message => "debe estar presente"}


	HUMANIZED_ATTRIBUTES = {
    :name => "El nombre",
    :email => "El correo",
    :phone => "El teléfono",
    :address => "La direccion",
    :password => "La contraseña",
    :points => "Los puntos",
    :password_confirmation => "La contraseña de confirmación",
    :country_id => "El país"
 	 }

    def self.human_attribute_name(attr, options={})
    	HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  	end




	def Kreaideasuser.authenticate(name, password)
		if user = find_by_name(name)
			if user.hashed_password == encrypt_password(password, user.salt)
				user
			end
		end
	end
	
	def Kreaideasuser.encrypt_password(password, salt)
		Digest::SHA2.hexdigest(password + "wibble" + salt)
	end
	# 'password' is a virtual attribute
	def password=(password)
		@password = password
		generate_salt
		if password.present?
			generate_salt
			self.hashed_password = self.class.encrypt_password(password, salt)
		end
	end

	private
	def password_must_be_present
		errors.add(:password, "Missing password" ) unless hashed_password.present?
	end
	def generate_salt
		self.salt = self.object_id.to_s + rand.to_s
	end
end