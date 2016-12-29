class ListsController < ApplicationController
  before_action :get_user

  def create
    @list = List.new(list_params)
    @list.user = get_user

    unless @list.save
      flash[:error] = "Something went wrong."
    end

    redirect_to '/dashboard'
  end

  def show
    @list = List.find_by(id: params[:id])
    @place = ListPlace.new
  end

  private

  def list_params
    params.require(:list).permit(:title, :description)
  end

  def get_user
    @user = User.find_by(id: params[:user_id])
  end
end
