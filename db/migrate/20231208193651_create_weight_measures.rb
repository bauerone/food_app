class CreateWeightMeasures < ActiveRecord::Migration[7.1]
  def change
    create_table :weight_measures do |t|
      t.date :measure_date
      t.float :weight
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
