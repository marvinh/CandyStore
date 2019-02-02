class CandiesController < ApplicationController
  before_action :set_candy, only: [:show, :edit, :update, :destroy]

  # GET /candies
  # GET /candies.json
  def index
    @candies = Candy.all
  end

  # GET /candies/1
  # GET /candies/1.json
  def show
  end

  # GET /candies/new
  def new
    @shop = Shop.find(params[:shop_id])
    @candy = Candy.new
  end

  # GET /candies/1/edit
  def edit
  end

  # POST /candies
  # POST /candies.json
  def create
    if Shop.exists?(candy_params[:shop_id]) == false
      respond_to do |format|
          @candy = Candy.where(candy_params)[0]
          format.html { redirect_to shops_path, notice: 'Shop does not exist.' }
          format.json { render json: nil, status: :unprocessable_entity }
      end
    else
    @shop = Shop.find(candy_params[:shop_id])
    @candy = Candy.new(candy_params)
    respond_to do |format|
        if Candy.where(candy_params).exists?
          @candy = Candy.where(candy_params)[0]
          format.html { redirect_to @candy, notice: 'Duplicate exists in this shop.' }
          format.json { render :show, status: :created, location: @candy }
        elsif @candy.save
          format.html { redirect_to @candy, notice: 'Candy was successfully created.' }
          format.json { render :show, status: :created, location: @candy }
        else
          format.html { render :new }
          format.json { render json: @candy.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /candies/1
  # PATCH/PUT /candies/1.json
  def update
    respond_to do |format|
      if @candy.update(candy_params)
        format.html { redirect_to @candy, notice: 'Candy was successfully updated.' }
        format.json { render :show, status: :ok, location: @candy }
      else
        format.html { render :edit }
        format.json { render json: @candy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candies/1
  # DELETE /candies/1.json
  def destroy
    @shop = Shop.find(@candy.shop_id)
    @candy.destroy
    respond_to do |format|
      format.html { redirect_to @shop, notice: 'Candy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candy
      @candy = Candy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def candy_params
      params.require(:candy).permit(:name, :shop_id)
    end
end
