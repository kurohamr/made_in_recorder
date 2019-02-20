class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :thing
      t.text :description#, null: false
      t.float :latitude#, null: false
      t.float :longitude#, null: false
      t.string :place, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
