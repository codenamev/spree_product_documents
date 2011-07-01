# Add "Document" to Product Model
Product.class_eval do
  has_many :docs, :as => :viewable, :order => :position, :dependent => :destroy
end
