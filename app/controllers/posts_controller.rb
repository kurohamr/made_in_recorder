class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  # before_action :login_required

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    #buildはアソシエーション先のプロパティを作りつつくっつける
    @post.build_thing(name: post_thing_params[:thing_name])
    @post.build_place(name: post_place_params[:place_name])
    @post.place.build_address(place_address_params)
    @post.thing.build_asset(thing_asset_params)
    if @post.save
      redirect_to post_path(@post.id)
    else
      render 'edit'
    end
  end

  def show; end

  def edit; end

  def update
    # if @post.update(post_params)
    #   @post.relation_labels.delete_all #改善の余地あり
    #   if params[:post][:label_ids].present?
    #     params[:post][:label_ids].each do |value|
    #       postLabel.create(label_id: value, post_id: @post.id)
    #     end
    #   end
    #   redirect_to post_path(@post.id), notice: 'post updated!'
    #   # redirect_to post_path, notice: 'post updated!'
    # else
    #   render 'edit'
    # end
  end

  def destroy
    # @post.destroy
    # redirect_to posts_path, notice: 'post deleted.'
  end

private
  def set_post
    @post =Post.find(params[:id])
  end

  def post_params
    # :image, :image_cahce
    params.require(:post).permit(:description, :user_id)
  end

  def post_thing_params
    params.require(:post).permit(:thing_name)
  end

  def post_place_params
    params.require(:post).permit(:place_name)
  end

  def thing_asset_params
    params.require(:post).permit(:thing_name)
  end

  def place_address_params
    # :latitude, :longitude, :city,
    params.require(:post).permit(:country, :state, :city, :address1, :address2, :address3, :postcode)
  end

  def thing_asset_params
    # :latitude, :longitude
    params.require(:post).permit(:image)
  end

  # def login_required
  #   redirect_to new_session_path unless current_user
  # end
end
