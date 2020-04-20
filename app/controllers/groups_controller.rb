class GroupsController < ApplicationController
  def new
    if logged_in?
      @group = current_user.groups.new
    else
      redirect_to home_path
    end
  end

  def create
    params[:group][:name].downcase!
    @group = current_user.groups.create(group_params)
    if @group.save
      loop_and_store(@group)
      flash[:success] = 'Your group has been Successfully created !!'
      redirect_to(request.referrer)
    else
      flash.now[:warning] = @group.errors.full_messages
      render :new
    end
  end

  def show
    @group = Group.find(params[:id])
  end

  def index
    if logged_in?
      @groups = Group.all.order(name: :asc)
    else
      redirect_to home_path
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end

  def nutriment_id_param
    params.require(:group).tap do |permit|
      permit[:nutriments] = params[:group][:nutriments].permit!
    end
  end

  def loop_and_store(group)
    nutriment_id_param[:nutriments][:ids].each do |nutriment_id|
      group.nutriment_groups.relationship(group.id, nutriment_id) unless nutriment_id.empty?
    end
  end
end
