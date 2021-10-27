ActiveAdmin.register Product do
	permit_params :name, :description, :price, :stock_qty, :active, 
                images_attributes: [ :id, :image, :_destroy ]

  controller do
    before_action :get_product, only: [:active]

    def active
      @product.update(active: params[:active]) 
      flash[:notice] = 'Successfully changed the status.'
      respond_to do |format|
        format.html { redirect_to request.referer}
      end
    end

    private
    def get_product
      @product = Product.find(params[:id])
    end

  end

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :price
    column :stock_qty
    column :active do |product|
      render partial: 'products/active' , :locals => {:product => product}
    end
    column :created_at
    actions
  end

  show do |product|
  	attributes_table do
      row :name
      row :description
      row :price
      row :stock_qty
      row :active
      row :images do
        div do
          product.images.each do |img|
            div do
              image_tag url_for(img.image), size: "200x200"
            end
          end
        end
      end
      row :created_at
    end
    active_admin_comments
  end

  filter :name
  filter :price
  filter :stock_qty
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :price
      f.input :stock_qty
      f.input :active
      f.inputs "Images" do
      f.has_many :images, heading: false, allow_destroy: true do |image|
        image.input :image, :as => :file
      end
    end
    end
    f.actions
  end
end
