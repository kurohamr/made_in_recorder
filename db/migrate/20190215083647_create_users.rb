class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.text :introduction, null: false, default: ""
      t.string :place, null: false, default: ""
      t.float :latitude#, null: false, default: ""
      t.float :longitude#, null: false, default: ""
      t.timestamps
    end
  end
end
