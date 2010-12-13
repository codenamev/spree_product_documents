# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class ProductDocumentsExtension < Spree::Extension
  version "1.0"
  description "Adds ability to add various downloadable documents to products/variants."
  url "http://github.com/mosaic/spree_document_manager"

  # Please use product_documents/config/routes.rb instead for extension routes.

  # def self.require_gems(config)
  #   config.gem "gemname-goes-here", :version => '1.2.3'
  # end
  
  def activate
    
    # Add "Document" to Product Model
    Product.class_eval do
      has_many :docs, :as => :viewable, :order => :position, :dependent => :destroy
    end

    # Make the Doc Helper available to all views
    Spree::BaseController.class_eval do
	helper DocsHelper
    end

    # make your helper avaliable in all views
    # Spree::BaseController.class_eval do
    #   helper YourHelper
    # end
  end
end
