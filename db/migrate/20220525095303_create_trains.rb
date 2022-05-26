class CreateTrains < ActiveRecord::Migration[7.0]
  def change
    create_table :trains do |t|
      t.string :name
      t.integer :line_id
      t.decimal :total_weight
      t.decimal :total_volume
      t.decimal :cost
      t.integer :status
      t.timestamps
    end
  end
end
