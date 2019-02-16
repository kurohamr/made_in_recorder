class CreateThingTags < ActiveRecord::Migration[5.2]
  def change
    create_table :thing_tags do |t|
      t.references :thing, foreign_key: true
      t.references :tag, foreign_key: true
      t.timestamps
    end
  end
end
