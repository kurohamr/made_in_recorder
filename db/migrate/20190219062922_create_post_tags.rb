# frozen_string_literal: true

class CreatePostTags < ActiveRecord::Migration[5.2]
  def change
    create_table :posts_tags, id: false do |t|
      # create_table :post_tags, id: false do |t|
      t.references :post, foreign_key: true
      t.references :tag, foreign_key: true
      t.timestamps
    end
  end
end
