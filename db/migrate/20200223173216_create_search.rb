class CreateSearch < ActiveRecord::Migration[6.0]
  def change
    create_table :search do |t|
      t.decimal :long
      t.decimal :lat
      t.integer :area
      t.date :began
      t.date :ended
      t.integer :dead
      t.integer :displaced
      t.string :maincause
      t.references :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
