class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  # before_filter :check_user, only: [:edit, :update, :destroy]

# load_and_authorize_resource  :through => :current_user

  def index
    @page_title = "Binder Bruce"
    @user = current_user ||= ((User.find(session[:user_id]) if session[:user_id]) || User.new)


    if params[:category].blank?
      @products = Product.all.order("created_at DESC").search(params[:term])
    else
      @category_id = Category.find_by(name: params[:category]).id
      @products = Product.where(category_id: @category_id).order("created_at DESC")
    end
  end


  def show
    set_meta_tags title: @product.name,
                  site: 'Binder Bruce',
                  reverse: true,
                  description: @product.brief,
                  keywords: 'international, binder, harvester, truck, scout, classic, vintage, auto, automotive, used, parts, engine, interior, exterior, car, wheel, electric, window, side, trunk, rear'
   
  # %w(name brief description buylink verdict category_id youtube goodverdict).each do |attr|
  #   instance_variable_set "@#{attr}", @product[attr].present?
  #   end
  end


  def new
    @product = Product.new
    @categories = Category.all.map{|c| [c.name, c.id ] }
  end


  def edit
  	@categories = Category.all.map{|c| [ c.name, c.id ] }
  end


  def create
    @product = Product.new(product_params)
    # @product.images.attach(params[:images])

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end


  def update
  	# @product.category_id = params[:category_id]
  	
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end


  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }

    end
  end

  def remove_attachment
    @img = ActiveStorage::Attachment.find(params[:id])
    @product = @img.record
    @img.purge
    redirect_to @product
  end

# def make_image_featured
#     @images = ActiveStorage::Attachment.find(params[:id])
#     @images.update_attributes(:fpic => true)
#     redirect_back(fallback_location: products_path)
#   end

#   def reset_featured
#     @images = ActiveStorage::Attachment.where(:record_id => params[:id])
#     @images.update_all(:fpic => false)
#   redirect_back(fallback_location: products_path)
# end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :main_picture, :part_number, :brief, :price, :bullet1, :bullet2, :bullet3, :bullet4, :description, :buylink, :verdict, :category_id, :image, :youtube, :user_id, :goodverdict, :term, images: [])
    end

    def check_user
      if current_user != @product.user
        redirect_to root_url
      end
    end
end
