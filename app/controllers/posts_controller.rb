class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  # before_action :login_required

  def index
    @posts = Post.all
    #allじゃなくする
  end

  def new
    @post = Post.new
    @post.place.build_address()
    @post.thing.build_asset()
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.asset.image = params[:post][:asset_attributes][:image].tempfile
    # binding.pry
    if @post.save
      redirect_to post_path(@post.id)
    else
      render 'edit'
    end
  end

  def hashtags
    tag = Tag.find_by(name: params[:name])
    @posts = tag.posts
  end

  def show; end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post.id), notice: 'post updated!'
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
    @post = Post.find(params[:id])
  end

  def post_params
    # :image, :image_cahce
    params.require(:post).permit(
      :description,
      :user_id,
      :place,
      :thing,
      :latitude,
      :longitude,
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
        ],
    )
  end
  # def login_required
  #   redirect_to new_session_path unless current_user
  # end
end
