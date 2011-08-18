# Make the Doc Helper available to all views
ProductsController.class_eval do
  helper DocsHelper
end
