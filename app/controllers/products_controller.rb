class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:notice] = "Ваш продукт отправлен на модерацию"
      redirect_to products_path
    else
      flash[:alert] = "К сожалению не получается создать продукт"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def product_params
    params.require(:product).permit(:name, :calorie_content, :proteins, :fats, :carbohydrates, :image)
  end
end
