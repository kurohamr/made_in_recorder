# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[show edit update destroy]
  before_action :set_user, only: %i[show edit update destroy]
  before_action :check_right_user, only: %i[show edit update destroy]

  def show
    @tags = @user.tags
    @posts = @user.favorite_posts.includes(:asset)
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
    end
    @user.attributes = user_params.permit(
                        :name,
                        :introduction,
                        :place,
                        :latitude,
                        :longitude,
                        :email,
                        :password,
                        :password_confirmation
                      )
    if @user.save
      sign_in(@user, bypass: true)
      redirect_to user_path(@user.id), notice: '編集されました'
    else
      render 'edit'
    end
  end

  private

  def set_user
    @user = User.find(params[:id]) # if current_user.present?
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
      ]
    )
  end

  def check_right_user
    if user_signed_in? && current_user.id != @user.id
      flash[:notice] = '権限がありません'
      redirect_to(posts_path)
    end
  end
end
