# frozen_string_literal: true

class FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @favorite = current_user.favorites.find_or_create_by(post_id: params[:post_id])
  end

  def destroy
    this_post_id = set_post_id
    @post = Post.find(this_post_id)
    @favorite = current_user.favorites.find_by(id: params[:id]).destroy
  end

  private

  def set_post_id
    current_user.favorites.find_by(id: params[:id]).post_id
  end
end
