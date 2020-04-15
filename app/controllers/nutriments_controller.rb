class NutrimentsController < ApplicationController
  def new
    unless logged_in?
      redirect_to home_path
    else
      @nutriment = current_user.nutriments.new
    end
  end

  def create
    params[:nutriment][:name].downcase!
    @nutriment = current_user.nutriments.create(nutriment_params)
    if @nutriment.save
      loop_and_store(@nutriment)
      flash[:success] = "Your nutriment has been Successfully created !!"
      redirect_to(request.referrer)
    else
      flash.now[:warning] = @nutriment.errors.full_messages
      render :new
    end
  end

  def index
    unless logged_in?
      redirect_to home_path
    else
      @nutriments = current_user.nutriments.order(created_at: :desc)
    end
  end

  def no_group_index
    unless logged_in?
      redirect_to home_path
    else
      @nutriments = current_user.nutriments.order(created_at: :desc).select { |ntr| ntr if ntr.nutriment_groups.empty? }
    end
  end

  private

  def nutriment_params
    params.require(:nutriment).permit(:name, :amount)
  end

  def group_id_param
    params.require(:nutriment).tap do |permit|
      permit[:groups] = params[:nutriment][:groups].permit!
    end
  end

  def loop_and_store(nutriment)
    group_id_param[:groups][:ids].each do |group_id|
      nutriment.nutriment_groups.relationship(group_id, nutriment.id) unless group_id.empty?
    end
  end
end
