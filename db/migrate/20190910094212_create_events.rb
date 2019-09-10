class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.datetime :date, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.integer :creator_id, null: false

      t.timestamps
    end

    add_index :events, :title
    add_index :events, :creator_id
  end
end
