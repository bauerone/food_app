class MealsController < ApplicationController
  def index
    @meals = Meal.where(verified: true)
  end

  def show
    @meal = Meal.find(params[:id])
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
    @meal.user_id = current_user.id

    if @meal.save
      add_products(@meal)
      flash[:notice] = "Ваш рецепт отправлен на модерацию"
      redirect_to meals_path
    else
      flash[:alert] = "К сожалению не получается создать рецепт"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @meal = Meal.find(params[:id])
  end

  def update
    
  end

  def destroy
    @meal = Meal.find(params[:id])
  end

  def add_product
    @products = Product.where(verified: true)
  end

  private

  def meal_params
    params.require(:meal).permit(:name, :description, :recipe, :category, :image)
  end

  def add_products(meal)
    raw_data = JSON.parse(params.to_json)

    product_names = raw_data.select { |key, _| key.starts_with?('product_name') }.values
    product_weights = raw_data.select { |key, _| key.starts_with?('product_weight')}.values

    products = product_names.zip(product_weights)

    products.each do |product|
      MealProduct.create(meal: meal, product: Product.find_by(name: product.first), weight: product.second)
    end
  end
end
