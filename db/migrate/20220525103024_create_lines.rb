class CreateLines < ActiveRecord::Migration[7.0]
  def change
    create_table :lines do |t|
      t.string :source
      t.string :destination
      t.integer :status
      t.timestamps
    end
  end
end
