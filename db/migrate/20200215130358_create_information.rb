class CreateInformation < ActiveRecord::Migration[6.0]
  def change
    create_table :information do |t|
      t.date :began
      t.date :ended
      t.string :validation
      t.integer :dead
      t.integer :displaced
      t.string :maincause
      t.references :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
