module Refinery
  module Products
    class Product < Refinery::Core::BaseModel
      has_attached_file :attach
      has_many :productimages ,:class_name => '::Productimage', :dependent => :destroy

       accepts_nested_attributes_for :productimages, :allow_destroy => true





      belongs_to :category , :class_name => '::Refinery::Categories::Category'
      belongs_to :subcategory, :class_name => '::Refinery::Subcategories::Subcategory'

      self.table_name = 'refinery_products'

      attr_accessible :name, :description, :price, :code, :author, :exchange, :bonus, :subcategory_id, :position,:attach,:productimages_attributes
      validates :subcategory_id,:name,:description, :price, :code, :author, :exchange, :bonus, :presence => { :message => "debe estar presente" }
      validates :code, :uniqueness => { :message => "ya esta en uso" }
      validates :price,:bonus,:exchange ,:numericality => { :message => "debe ser un número" }

  

    belongs_to :image, :class_name => '::Refinery::Image'

      HUMANIZED_ATTRIBUTES = {
    :code => "El código",
    :name => "El nombre",
    :price => "El precio",
    :author => "El autor",
    :bonus => "El bono",
    :exchange => "El canje",
    :description => "La descripción",
    :subcategory_id => "La subcategoria"
    
  }

  def self.human_attribute_name(attr, options={})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end
    end
  end
end
