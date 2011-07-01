require 'spree_core'
require 'spree_product_documents_hooks'

module SpreeProductDocuments
  class Engine < Rails::Engine
    def self.activate

      # Make the Doc Helper available to all views
      Spree::BaseController.class_eval do
        helper DocsHelper
      end
      
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.env == "production" ? require(c) : load(c)
      end
      
    end
    config.to_prepare &method(:activate).to_proc
    config.autoload_paths += %W(#{config.root}/lib)
  end
end
