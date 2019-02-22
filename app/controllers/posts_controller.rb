class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :hashtags, :new, :create, :edit, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :check_correct_user, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all.where(user_id: current_user.id)
    #allじゃなくする
    # binding.pry
  end

  def new
    @post = Post.new
    # @post.build_address()
    @post.build_asset()
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if params[:post][:asset_attributes]
      @post.asset.image = params[:post][:asset_attributes][:image].tempfile
      if @post.save
        redirect_to post_path(@post.id)
      else
        render 'edit'
      end
    else
      flash.now[:notice] = "画像が必要です"
      render 'edit' #TODO:ここから飛ぶと画像のフォームがなくなる
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
        # address_attributes: [
        #   :country,
        #   :state,
        #   :city,
        #   :address1,
        #   :address2,
        #   :address3,
        #   :postcode
        # ],
    )
  end

  def check_correct_user
    if user_signed_in? && current_user.id != @post.id
        flash[:notice] = "権限がありません"
        redirect_to(root_path)
    end
  end
end
