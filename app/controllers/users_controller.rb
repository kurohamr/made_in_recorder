class UsersController < ApplicationController
before_action :authenticate_user!, only: [:show, :edit, :update]#,:destroy]
before_action :set_user, only: [:show, :edit, :update, :destroy]
before_action :check_edit_right, only: [:edit, :update, :destroy]#,:show]

  def show
    if @user.asset.blank? || @user.place.blank?
      redirect_to edit_user_path(@user.id), notice: "imageとplaceを設定してください"
    end
    @hash = Gmaps4rails.build_markers(@user) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.infowindow user.place
    end
  end

  def edit
  end

  def update
    # binding.pry
    @user.build_asset(user_params[:asset])
    @user.build_asset.image = user_params[:asset][:image]
    @user.build_address(user_params[:address])
    @user.attributes = (user_params.permit(:name, :introduction, :place, :latitude, :longitude, :email, :password, :password_confirmation))
    if @user.save
      redirect_to user_path(@user.id), notice: 'user updated!'
      # sign_in_and_redirect @user
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


  def check_edit_right
    if user_signed_in? && current_user.id != @user.id
        flash[:notice] = "権限がありません"
        redirect_to(root_path)
    end
  end
end
