require 'spree_core'
require 'spree_product_documents_hooks'

module ProductDocuments
  class Engine < Rails::Engine
    config.autoload_paths += %W(#{config.root}/lib)
  
    def self.activate
    
      # Add "Document" to Product Model
      Product.class_eval do
        has_many :docs, :as => :viewable, :order => :position, :dependent => :destroy
      end

      # Make the Doc Helper available to all views
      Spree::BaseController.class_eval do
	      helper DocsHelper
      end
    
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.env.production? ? require(c) : load(c)
      end

    end
  end
end
