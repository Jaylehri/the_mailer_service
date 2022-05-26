class CreateParcels < ActiveRecord::Migration[7.0]
  def change
    create_table :parcels do |t|
      t.integer :train_id
      t.integer :user_id
      t.decimal :volume
      t.decimal :weight
      t.decimal :cost
      t.timestamps
    end
  end
end
