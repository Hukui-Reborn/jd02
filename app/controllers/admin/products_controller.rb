class Admin::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path, notice:"成功增加商品"
    else
      render :new
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_products_path, notice:"修改商品信息成功"
    else
      render :edit
    end

  end
  private

  def product_params
    params.require(:product).permit(:title,:description,:quantity,:price)
  end

end
