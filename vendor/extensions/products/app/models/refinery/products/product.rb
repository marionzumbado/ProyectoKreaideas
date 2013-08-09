module Refinery
  module Products
    class Product < Refinery::Core::BaseModel
      belongs_to :subcategory, :class_name => '::Refinery::Subcategories::Subcategory'
      self.table_name = 'refinery_products'

      attr_accessible :name, :description, :price, :downloadpath, :image_id, :code, :author, :exchange, :bonus, :subcategory_id, :position
      validates :name,:description, :price, :downloadpath, :image_id, :code, :author, :exchange, :bonus, :presence => { :message => "debe estar presente" }
      validates :code, :uniqueness => { :message => "ya esta en uso" }
      validates :price,:bonus,:exchange ,:numericality => { :message => "debe ser un número" }

  

    belongs_to :image, :class_name => '::Refinery::Image'

      HUMANIZED_ATTRIBUTES = {
    :code => "El código",
    :name => "El nombre",
    :price => "El precio",
    :downloadpath => "La direccion de descarga",
    :author => "El autor",
    :bonus => "El bono",
    :exchange => "El canje",
    :description => "La descripción",
    :image => "La imágen"
    
  }

  def self.human_attribute_name(attr, options={})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end
    end
  end
end
