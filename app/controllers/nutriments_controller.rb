class NutrimentsController < ApplicationController
  def new
    if logged_in?
      @nutriment = current_user.nutriments.new
    else
      redirect_to home_path
    end
  end

  def create
    params[:nutriment][:name].downcase!
    @nutriment = current_user.nutriments.create(nutriment_params)
    if @nutriment.save
      loop_and_store(@nutriment)
      flash[:success] = 'Your nutriment has been Successfully created !!'
      redirect_to(request.referrer)
    else
      flash.now[:warning] = @nutriment.errors.full_messages
      render :new
    end
  end

  def index
    if logged_in?
      @nutriments = current_user.nutriments.includes(:groups).order(created_at: :desc)
    else
      redirect_to home_path
    end
  end

  def no_group_index
    if logged_in?
      @nutriments = current_user.nutriments.includes(:groups).order(created_at: :desc).select do |ntr|
        ntr if ntr.nutriment_groups.empty?
      end
    else
      redirect_to home_path
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
