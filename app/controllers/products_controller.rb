class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  # before_filter :check_user, only: [:edit, :update, :destroy]

# load_and_authorize_resource  :through => :current_user

  def index
    @user = current_user ||= ((User.find(session[:user_id]) if session[:user_id]) || User.new)
    @products = Product.all
  end

  # GET /products/1
  def show
   
  %w(name brief description buylink verdict category_id youtube goodverdict).each do |attr|
    instance_variable_set "@#{attr}", @product[attr].present?
    end
  end

  # GET /products/new
  def new
    @product = Product.new
    @categories = Category.all.map{|c| [c.name, c.id ] }
  end

  # GET /products/1/edit
  def edit
  	@categories = Category.all.map{|c| [ c.name, c.id ] }
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    @product.category_id = params[:category_id] 

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
  	@product.category_id = params[:category_id]
  	
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :brief, :description, :buylink, :verdict, :category_id, :image, :youtube, :goodverdict)
    end

    def check_user
      if current_user != @product.user
        redirect_to root_url
      end
    end
end
