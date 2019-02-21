class UsersController < ApplicationController
before_action :authenticate_user!, only: [:edit, :update]#,:destroy]
before_action :set_user, only: [:show, :edit, :update, :destroy]
before_action :check_correct_user, only: [:edit, :update, :destroy]#,:show]

  def show
    @hash = Gmaps4rails.build_markers(@user) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.infowindow user.place
    end
  end

  def edit
  end

  def update
    @user.build_asset(user_params[:asset])
    @user.build_asset.image = user_params[:asset][:image]
    @user.build_address(user_params[:address])
    @user.attributes = (user_params.permit(:name, :introduction, :place, :latitude, :longitude, :email, :password, :password_confirmation))
    if @user.save
      redirect_to user_path(@user.id), notice: 'user updated!'
    else
      render 'edit'
    end
  end

  def destroy

  end

  private

  def set_user
    @user = User.find(params[:id]) #if current_user.present?
  end

  # TODO:いずれ改善
  def user_params
    params.require(:user).permit(
      :name,
      :introduction,
      :place,
      :latitude,
      :longitude,
      :email,
      :password,
      :password_confirmation,
      asset: [
        :image
      ],
      address:  [
        :country,
        :state,
        :city,
        :address1,
        :address2,
        :address3,
        :postcode
      ])
  end
end
