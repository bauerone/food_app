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
  end

  def edit
    @meal = Meal.find(params[:id])
  end

  def update
    
  end

  def destroy
    @meal = Meal.find(params[:id])
  end
end
