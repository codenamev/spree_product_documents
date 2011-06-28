class Admin::DocsController < Admin::ResourceController
  before_filter :load_data
	
  create.before :set_viewable
  update.before :set_viewable
  destroy.before :destroy_before

  def update_positions
    params[:positions].each do |id, index|
      Doc.update_all(['position=?', index], ['id=?', id])
    end

    respond_to do |format|
      format.js { render :text => 'Ok' }
    end
  end
  
  private

  def location_after_save
    admin_product_docs_url(@product)
  end

  def load_data
    @product = Product.find_by_permalink(params[:product_id])
  end

  def set_viewable
    if !params[:doc].empty? and params[:doc].has_key? :viewable_id
      if params[:doc][:viewable_id] == "All"
        @doc.viewable = @product
      else
	      @doc.viewable_type = 'Product'
	      @doc.viewable_id = @product.id
      end
    else
	    @doc.viewable = @product
    end
  end
	
  def update_before
     @doc.viewable_type = 'Product'
     @doc.viewable_id = @product.id
  end

  def destroy_before 
    @viewable = object.viewable
  end

end
