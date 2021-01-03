class PlansController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_plan, only: [:show, :edit, :update, :destroy]

  def index
    @plans = Plan.includes(:user).order('created_at DESC')

    @q = Plan.ransack(params[:q])
    @q_plans = @q.result(distinct: true)
    
    @selecttimes = Selecttime.all
    @categories = Category.all
    @seasons = Season.all
    @timezones = Timezone.all
    @places = Plan.all
  end

  def search
    @q = Plan.search(search_params)
    @plans = @q.result(distinct: true)
  end

  def new
    @plan = Plan.new
    @user = User.includes(:user)
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      redirect_to root_path
    else
      render :new 
    end
  end

  def show
  end

  def edit
  end

  def update
    if @plan.update(plan_params)
      redirect_to plan_path(@plan)
    else
      render :edit
    end
  end
 
  def destroy
    @plan.destroy
  end
end
  
private
  def plan_params
    params.require(:plan).permit(
      :title,:concept,:item, :cost, :process, :selecttime_id, :timezone_id, :place, :category_id ,
      :season_id, :image ).merge(user_id: current_user.id)
  end

  def set_plan
    @plan = Plan.find(params[:id])
  end

  def search_params
    params.require(:q).permit(:title_or_concept_or_item_cont, :selecttime_id_eq, :category_id_eq, 
   :season_id_eq, :place_eq, :cost_gteq, :cost_lteq, :time_id_eq)
  end