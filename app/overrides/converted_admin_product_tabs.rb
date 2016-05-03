Deface::Override.new(:virtual_path => "admin/shared/_product_tabs",
                     :name => "converted_admin_product_tabs",
                     :insert_after => "[data-hook='admin_product_tabs'], #admin_product_tabs[data-hook]",
                     :partial => "admin/products/docs",
                     :disabled => false)
