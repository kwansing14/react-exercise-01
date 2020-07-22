class CreateClockouts < ActiveRecord::Migration[6.0]
  def change
    create_table :clockouts do |t|
      t.string :location
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
