class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :hashtags, :new, :create, :edit, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :check_correct_user, only: [:edit, :update, :destroy, :show]

  def index
    @posts = current_user.posts.includes(:asset)
  end

  def new
    @post = Post.new
    # @post.build_address()
    @post.build_asset()
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.build_asset(image: params[:post][:asset_attributes][:image].tempfile)  if params[:post][:asset_attributes][:image]
    if @post.save
      redirect_to post_path(@post.id)
    else
      render 'new'
    end
  end

  def hashtags
    tag = Tag.find_by(name: params[:name])
    @posts = tag.posts.where(user_id: current_user.id)
  end

  def show
    @hash = Gmaps4rails.build_markers(@post) do |post, marker|
      marker.lat post.latitude
      marker.lng post.longitude
      marker.infowindow post.thing
    end
  end

  def edit
    @post.asset.image.cache! unless @post.asset.image.blank?
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post.id), notice: '更新しました'
    else
      render 'edit'
    end
  end

  def destroy
    if @post.destroy
      redirect_to posts_path, notice: 'post deleted.'
    else
      #rescue???
    end
  end

  private
  def set_post
      @post = current_user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(
      :description,
      :user_id,
      :place,
      :thing,
      :latitude,
      :longitude,
        asset_attributes: [
          :image,
          :image_cache
        ],)
  end

  def check_correct_user
    if user_signed_in? && current_user.id != @post.user_id
        flash[:notice] = "権限がありません"
        redirect_to(posts_path)
    end
  end
end
