class CreateAssets < ActiveRecord::Migration[5.2]
  def change
    create_table :assets do |t|
      t.string :image, null: false
      t.references :assetable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
