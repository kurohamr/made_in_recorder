class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :country, null: false , default: ""
      t.string :state, null: false , default: ""
      t.string :city, null: false , default: ""
      t.string :address1, null: false , default: ""
      t.string :address2, null: false , default: ""
      t.string :address3, null: false , default: ""
      t.string :postcode, null: false , default: ""
      t.references :addressable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
