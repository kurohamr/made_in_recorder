class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  # before_action :set_nest_params, only: [:edit, :update]
  # before_action :login_required

  def index
    @posts = Post.all
    #allじゃなくする
  end

  def new
    @post = Post.new
    @post.build_thing()
    @post.build_place()
    @post.place.build_address()
    @post.thing.build_asset()
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post.id)
    else
      render 'edit'
    end
  end

  def show; end

  def edit
    binding.pry
  end

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

  def set_post_when_edit_action
    @post.thing = Thing.find_by(post_id: @post.id)
    @post.place = Place.find_by(post_id: @post.id)
    # @post.thing.asset = Asset.find(@postaddressable_id)
  end

  def post_params
    # :image, :image_cahce
    params.require(:post).permit(
      :description,
      :user_id,
      thing_attributes: [
        :name,
        asset_attributes: [
          :image
        ]
      ],
      place_attributes: [
        :name,
        address_attributes: [
          :country,
          :state,
          :city,
          :address1,
          :address2,
          :address3,
          :postcode
        ]
      ],
    )
  end
  # def login_required
  #   redirect_to new_session_path unless current_user
  # end
end
