class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    respond_to do |format|
      format.json  { render json: @products, only: :title, include: {category: {only: [:title]} } }
      format.html
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
    3.times { @product.images.build }
  end

  # GET /products/1/edit
  def edit
    (3 - @product.images.count).times { @product.images.build }
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        upload
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
    respond_to do |format|
      if @product.update(product_params)
        upload
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


  def upload
    uploaded_io = params[:product][:images_attributes]

      uploaded_io.keys.map.with_index do |index, key|

        unless uploaded_io[key.to_s]["picture"].nil?

          @image_name = uploaded_io[key.to_s]["picture"].original_filename

          new_image = Image.new(name: @image_name, product_id: @product.id)
          new_image.save!

          @image_id = new_image.id

          @image_stored = File.read(uploaded_io[key.to_s]["picture"].tempfile.path)

            File.open(Rails.root.join('app', 'assets', 'images', @image_id.to_s.concat("." + @image_name.split(".").last)), 'wb') do |file|
              file.write(@image_stored)
            end
        end

      end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :description, :image_url, :price, :discount_price, :permalink, :enabled, :category_id)
    end

    def who_bought
      @product = Product.find(params[:id])
      @latest_order = @product.orders.order(:updated_at).last
        if stale?(@latest_order)
        respond_to do |format|
        format.atom
        end
      end
    end
end
