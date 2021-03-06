class UsersController < ApplicationController
  before_action :authenticate_user!, only:[:index, :show, :edit]
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @plans = current_user.plans
  end

  def new
  end

  def show 
    @bookmarks = Bookmark.all
  end

  def edit
  end

  def update
    if @user.update(user_params)
       redirect_to user_path
    else 
       render :edit
    end
  end  

end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email,:name, :image)
  end


