class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.text :introduction#, null: false
      t.string :place #null: false
      t.float :latitude#, null: false
      t.float :longitude#, null: false
      t.timestamps
    end
  end
end
