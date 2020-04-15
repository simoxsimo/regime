class GroupsController < ApplicationController
  def new
    unless logged_in?
      redirect_to home_path
    else
      @group = current_user.groups.new
    end
  end

  def create
    params[:group][:name].downcase!
    @group = current_user.groups.create(group_params)
    if @group.save
      loop_and_store(@group)
      flash[:success] = "Your group has been Successfully created !!"
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
    unless logged_in?
      redirect_to home_path
    else
      @groups = Group.all.order(name: :asc)
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
