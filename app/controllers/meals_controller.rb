class MealsController < ApplicationController
  def index
    @meals = Meal.all
  end

  def show
    @meal = Meal.find(params[:id])
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)

    if @meal.save
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
    p @products
  end

  private

  def meal_params
    params.require(:meal).permit(:name, :description, :recipe, :category, :image)
  end
end
