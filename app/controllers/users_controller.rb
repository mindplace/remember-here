class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.lists << List.create(title: "Uncategorized Places", description: "Default list.")

    if @user.save
      session[:user_id] = @user.id
      redirect_to "/dashboard"
    else
      render :new
    end
  end

  def show
    @user = User.find_by(id: session[:user_id])

    if !@user
      flash[:error] = "You're not authorized to see this page."
      redirect_to "/sessions/new"
    else
      @lists = @user.lists
      @list = List.new
    end
  end

  def edit
    binding.pry
  end

  def update
    binding.pry
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
