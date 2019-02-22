class CreateAssets < ActiveRecord::Migration[5.2]
  def change
    create_table :assets do |t|
      #TODO: null: falseの扱い
      t.string :image, null: false, default: ""
      t.references :assetable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
