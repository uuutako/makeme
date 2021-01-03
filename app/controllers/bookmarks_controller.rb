class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @bookmarks = Bookmark.where(user_id: @user.id).all
  end


  def create
    @plan = Plan.find(params[:plan_id])
    bookmark = current_user.bookmarks.build(plan_id: params[:plan_id])
      if @plan.user_id != current_user.id  
        bookmark.save
        redirect_to plans_path
      end
  end

  def destroy
    bookmark = Bookmark.find_by(plan_id: params[:plan_id], user_id: current_user.id)
    bookmark.destroy!
    redirect_to plans_path
  end

end
