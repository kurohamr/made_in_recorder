# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.text :introduction, null: false, default: ''
      t.string :place, null: false, default: ''
      t.float :latitude, null: false, default: 35.681236
      t.float :longitude, null: false, default: 139.767125
      t.timestamps
    end
  end
end
