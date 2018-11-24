class CreateVenues < ActiveRecord::Migration[5.2]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :location
      t.integer :age
      t.string :email
      t.string :phone
      t.integer :capacity
      t.string :music
      t.string :dress_code
      t.string :website
      t.string :category
      t.belongs_to :owner, index: true

      t.timestamps
    end
  end
end
