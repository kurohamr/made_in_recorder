class UsersController < ApplicationController
before_action :authenticate_user!, only: [:show, :edit, :update]#,:destroy]
before_action :set_user, only: [:show, :edit, :update, :destroy]
before_action :check_edit_right, only: [:edit, :update, :destroy]#,:show]

  def show
    @hash = Gmaps4rails.build_markers(@user) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.infowindow user.place
    end
  end

  def edit; end

  def update
    if user_params[:asset]
      @user.build_asset(user_params[:asset])
      @user.build_asset.image = user_params[:asset][:image]
    else
      # set_default_image
    end
    @user.attributes = (user_params.permit(:name, :introduction, :place, :latitude, :longitude, :email, :password, :password_confirmation))
    if @user.save
      redirect_to user_path(@user.id), notice: 'user updated!'
    else
      render 'edit'
    end
    sign_in(@user, bypass: true)
  end

  # def destroy; end

  private

  def set_user
    @user = User.find(params[:id]) #if current_user.present?
  end

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
      # address:  [
      #   :country,
      #   :state,
      #   :city,
      #   :address1,
      #   :address2,
      #   :address3,
      #   :postcode
      # ]
    )
  end

  def check_edit_right
    if user_signed_in? && current_user.id != @user.id
        flash[:notice] = "権限がありません"
        redirect_to(posts_path)
    end
  end

  # def set_default_image(user)
  #   user.asset.image =  Pathname.new("#{Rails.public_path}/noimage.jpg").open if user.asset.image.nil?
  #   return user
  # end
end
