class NickspicksController < ApplicationController
  before_action :set_nickspick, only: [:show, :edit, :update, :destroy]

  # GET /nickspicks
  def index
    @nickspicks = Nickspick.all
  end

  # GET /nickspicks/1
  def show
  end

  # GET /nickspicks/new
  def new
    @nickspick = Nickspick.new
  end

  # GET /nickspicks/1/edit
  def edit
  end

  # POST /nickspicks
  def create
    @nickspick = Nickspick.new(nickspick_params)

    respond_to do |format|
      if @nickspick.save
        format.html { redirect_to @nickspick, notice: 'Nickspick was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /nickspicks/1
  def update
    respond_to do |format|
      if @nickspick.update(nickspick_params)
        format.html { redirect_to @nickspick, notice: 'Nickspick was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /nickspicks/1
  def destroy
    @nickspick.destroy
    respond_to do |format|
      format.html { redirect_to nickspicks_url, notice: 'Nickspick was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nickspick
      @nickspick = Nickspick.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nickspick_params
      params.require(:nickspick).permit(:name, :description, :buylink, :youtube, :image)
    end
end
