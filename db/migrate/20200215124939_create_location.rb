class CreateLocation < ActiveRecord::Migration[6.0]
  def change
    create_table :location do |t|
      t.decimal :long
      t.decimal :lat
      t.integer :area
      t.references :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
