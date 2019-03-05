class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.find_or_create_by(post_id: params[:post_id])
    redirect_to post_path(id: params[:post_id]), notice: "#{favorite.post.user.name}さんの投稿をお気に入り登録しました"
  end

  def destroy
    this_post_id = set_post_id
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to post_path(post_id: this_post_id), notice: "#{favorite.post.user.name}さんの投稿をお気に入り解除しました"
  end

  private

  def set_post_id
    current_user.favorites.find_by(id: params[:id]).post_id
  end
end
