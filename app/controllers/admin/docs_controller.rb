class Admin::DocsController < Admin::BaseController
  resource_controller
  before_filter :load_data
	
  new_action.response do |wants|
  	wants.html {render :action => :new, :layout => false}
  end

  create.response do |wants|
	wants.html {redirect_to admin_product_docs_url(@product)}
  end

  update.response do |wants|
	wants.html {redirect_to admin_product_docs_url(@product)}
  end
	
  create.before :set_viewable
  update.before :set_viewable
  destroy.before :destroy_before
  
  destroy.response do |wants| 
    wants.html do
	render :text => ""
    end
  end
 
  private

  def load_data
    @product = Product.find_by_permalink(params[:product_id])
  end

  def set_viewable
    if params[:doc].has_key? :viewable_id
	if params[:image][:viewable_id] == "All"
		object.viewable = @product
	else
		object.viewable_type = 'Product'
		object.viewable_id = @product.id
	end
    else
	object.viewable = @product
    end
  end
	
  def update_before
     object.viewable_type = 'Product'
     object.viewable_id = @product.id
  end

  def destroy_before 
    @viewable = object.viewable
  end

end
