class UsersController < ApplicationController
before_action :authenticate_user!, only: [:edit, :update, :destroy, :new, :create, :show]
before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all #TODO/ allじゃなくする
  end

  def show
    # binding.pry
  end

  def edit

  end

  def update
    if @user.update(user_params)
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

  def user_params
    params.require(:user).permit(
      :name,
      :introduction,
      :email,
      :password,
      :password_confirmation,
      asset_attributes: [
        :image
      ],
      address_attributes: [
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
