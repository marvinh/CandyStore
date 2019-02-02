class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]

  # GET /shops
  # GET /shops.json
  def index
    @shops = Shop.all
  end

  # GET /shops/1
  # GET /shops/1.json
  def show
    @shop = Shop.find(params[:id])
    @candies = @shop.candies
    @shelves = @shop.shelves
  end

  # GET /shops/new
  def new
    @shop = Shop.new
  end

  # GET /shops/1/edit
  def edit
  end

  # POST /shops
  # POST /shops.json
  def create
    @shop = Shop.new(shop_params)

    respond_to do |format|
      if @shop.save
        format.html { redirect_to @shop, notice: 'Shop was successfully created.' }
        format.json { render :show, status: :created, location: @shop }
      else
        format.html { render :new }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shops/1
  # PATCH/PUT /shops/1.json
  def update
    respond_to do |format|
      if @shop.update(shop_params)
        format.html { redirect_to @shop, notice: 'Shop was successfully updated.' }
        format.json { render :show, status: :ok, location: @shop }
      else
        format.html { render :edit }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shops/1
  # DELETE /shops/1.json
  def destroy
    @shop.destroy
    respond_to do |format|
      format.html { redirect_to shops_url, notice: 'Shop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_to_stock
    @shop = set_shop
    if Candy.exists?(id: shop_params[:candy_id]) == false || Shelf.exists?(id: shop_params[:shelf_id]) == false
      respond_to do |format|
        format.html { redirect_to @shop, notice: "Shelf or Candy does not exist." }
        format.json { head :no_content }
      end
    else
      #@shelf = Shelf.where(id: shop_params[:shelf_id]).first
      @stock = Stock.where(candy_id: shop_params[:candy_id], shelf_id: shop_params[:shelf_id])
      if @stock.exists?
        incrementby = shop_params[:quantity].to_i
        @stock.first.increment!(:quantity, incrementby)
      else
        Stock.create(candy_id: shop_params[:candy_id],shelf_id: shop_params[:shelf_id], quantity: shop_params[:quantity].to_i)    
      end
      respond_to do |format|
        format.html { redirect_to @shop, notice: "Successfully added to shelf" }
        format.json { head :no_content }
      end
    end
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop
      @shop = Shop.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shop_params
      params.require(:shop).permit(:name,:quantity,:candy_id,:shelf_id)
    end
end
