class ProductsController < ApplicationController
  before_action :set_product, only: :create
  load_and_authorize_resource :except => [:index, :order_history]
  skip_before_action :authenticate_user!, only: :index
  # GET /products
  # GET /products.json
  def index
    search = params[:search]
      @products = Product.search do
        fulltext search
      end
       @products = @products.results
       @order_item = current_order.order_items.new
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find params[:id]
  end

  # GET /products/new
  def new
    @product = Product.new
    @product.build_document
  end

  # GET /products/1/edit
  def edit
    @product = Product.find params[:id]
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to products_path, notice: 'Product was successfully created.' }
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
 def order_history
   if current_user.is?(:admin)
      @order_history = Order.where("product_id is not null")
    else
      @order_history = current_user.orders
  end
 end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.new(product_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit! # not liking it, need to die this
    end
end
