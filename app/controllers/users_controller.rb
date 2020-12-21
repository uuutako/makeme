class UsersController < ApplicationController
  before_action :authenticate_user!, only:[:show, :edit]
  before_action :set_user, only: [:show, :edit, :update]

  def new
  end

  def show 
  end

  def edit
  end

  def update!
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


