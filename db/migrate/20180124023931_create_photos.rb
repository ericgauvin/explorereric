class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.string :image
      t.string :country
      t.string :city
      t.string :year
      t.string :month

      t.timestamps
    end
  end
end
