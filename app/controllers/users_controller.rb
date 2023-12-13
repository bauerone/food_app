class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    redirect_to root_path unless current_user

    @chart_data = current_user.weight_measures.pluck(:measure_date, :weight)
    @weight_measure = WeightMeasure.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "User created successfully"
      redirect_to users_path
    else
      flash[:alert] = "User not created"
      render :new, status: :unprocessable_entity
    end
  end

  def add_weight_measure
    @weight_measure = WeightMeasure.new(measure_date: Date.today,
                                        weight: weight_measure_params[:weight],
                                        user: current_user)
    @weight_measure.save
    @chart_data = current_user.weight_measures.pluck(:measure_date, :weight)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def weight_measure_params
    params.require(:weight_measure).permit(:weight)
  end
end
