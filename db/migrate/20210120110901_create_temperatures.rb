class CreateTemperatures < ActiveRecord::Migration[6.0]
  def change
    create_table :temperatures do |t|
      t.string :sensor
      t.float :data
      t.string :data_row

      t.timestamps
    end
  end
end
