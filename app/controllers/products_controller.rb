class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  # before_filter :check_user, only: [:edit, :update, :destroy]

# load_and_authorize_resource  :through => :current_user

  def index
    @user = current_user ||= ((User.find(session[:user_id]) if session[:user_id]) || User.new)


    if params[:category].blank?
      @products = Product.all.order("created_at DESC").search(params[:term])
    else
      @category_id = Category.find_by(name: params[:category]).id
      @products = Product.where(category_id: @category_id).order("created_at DESC")
    end
  end


  def show
   
  %w(name brief description buylink verdict category_id youtube goodverdict).each do |attr|
    instance_variable_set "@#{attr}", @product[attr].present?
    end
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
    @product.category_id = params[:category_id] 

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end


  def update
  	@product.category_id = params[:category_id]
  	
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :brief, :description, :buylink, :verdict, :category_id, :image, :youtube, :user_id, :goodverdict, :term)
    end

    def check_user
      if current_user != @product.user
        redirect_to root_url
      end
    end
end
