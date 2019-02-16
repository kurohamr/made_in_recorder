class CreatePlaceTags < ActiveRecord::Migration[5.2]
  def change
    create_table :place_tags do |t|
      t.references :place, foreign_key: true
      t.references :tag, foreign_key: true
      t.timestamps
    end
  end
end
