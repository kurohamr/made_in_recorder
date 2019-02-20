class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :country#, null: false
      t.string :state#, null: false
      t.string :city#, null: false
      t.string :address1#, null: false
      t.string :address2#, null: false
      t.string :address3#, null: false
      t.string :postcode#, null: false
      t.references :addressable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
