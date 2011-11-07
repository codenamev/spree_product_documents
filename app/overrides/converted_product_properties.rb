Deface::Override.new(:virtual_path => "products/show",
                     :name => "converted_product_properties",
                     :insert_after => "[data-hook='product_properties'], #product_properties[data-hook]",
                     :partial => "products/product_documents",
                     :disabled => false)
