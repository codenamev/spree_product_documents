class SpreeProductDocumentsHooks < Spree::ThemeSupport::HookListener
  
  insert_after :admin_product_tabs, "admin/products/docs" 

  insert_after :product_properties, "products/product_documents"#, :product => @product

  # 
  # TODO: add document type configurations
  # insert_after :admin_configurations_sidebar_menu do
  #  '<li' + raw(' class="active"') if controller.controller_name == 'product_documents_settings' + '>' + link_to t("product_documents_settings"), admin_product_documents_settings_path + '</li>'
  # end

end
