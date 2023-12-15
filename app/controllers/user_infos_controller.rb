class UserInfosController < ApplicationController
  def show
    @current_user_info = UserInfo.find_by(user_id: current_user.id)
    puts @current_user_info.inspect
  end

  def new
    @user_info = UserInfo.new()
    @province = Province.all
  end

  def create
    @user_info = UserInfo.new(user_info_params.merge(user_id: current_user.id))

    if @user_info.save
      flash[:success] = "You've successfully added your information!"
      puts @user_info
      redirect_to @user_info
    else
      flash[:error] = "Could not save information"
    end
  end

  def edit
    @user_info = UserInfo.find_by(user_id: current_user.id)
    @province = Province.all
  end

  def update
    @user_info = UserInfo.find_by(user_id: current_user.id)

    puts "DEBUG: #{@user_info.inspect}"

    if @user_info.update(user_info_params)
      flash[:success] = "New profile information saved!"
      redirect_to @user_info
    else
      flash.now[:error] = "Can't save profile information!"
      render :edit
    end

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
