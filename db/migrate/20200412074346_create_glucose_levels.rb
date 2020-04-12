class CreateGlucoseLevels < ActiveRecord::Migration[5.1]
  def change
    create_table :glucose_levels do |t|
      t.integer :glucose
      t.integer :user_id

      t.timestamps
    end
  end
end
