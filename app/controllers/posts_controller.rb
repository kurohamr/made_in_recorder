class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  # before_action :login_required

  def index
    @posts = Post.all
  end

  def new
    @post = post.new
  end

  def create
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
    @post = post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :deadline, :priority, :status, :user_id, :label_ids)
  end

  # def login_required
  #   redirect_to new_session_path unless current_user
  # end
end
