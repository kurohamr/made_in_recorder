class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :thing, null: false
      t.text :description, null: false, default: ""
      t.float :latitude#, null: false, default: ""
      t.float :longitude#, null: false, default: ""
      t.string :place, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
