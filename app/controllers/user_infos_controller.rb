class UserInfosController < ApplicationController
  def show
    @current_user_info = UserInfo.find_by(user_id: params[:id])

  end

  def new
    @user_info = UserInfo.new()
    @province = Province.all
  end

  def create
    @user_info = UserInfo.new(user_info_params.merge(user_id: current_user.id))

    if @user_info.save
      flash[:success] = "New info successfully added!"
      redirect_to @user_info
    else
      flash[:error] = @user_info.inspect
      redirect_to root_path
    end

  end

  def update

  end

  def user_info_params
    params.require(:user_info).permit(
      :first_name,
      :last_name,
      :street,
      :postal_code,
      :city,
      :phone_number,
      :province_id
    )
  end
end
