class Productimage < ActiveRecord::Base
  # attr_accessible :title, :body
   belongs_to :attachable, :polymorphic => true
   has_attached_file :image, :styles => { :large => "800x800", :medium => "400x400>", :small => "200x200>" }
   attr_accessible :image
  
end
