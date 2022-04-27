class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.belongs_to :upload, null: false, foreign_key: true
      t.integer :x
      t.integer :y
      t.integer :width
      t.integer :height
      t.string :type

      t.timestamps
    end
  end
end
