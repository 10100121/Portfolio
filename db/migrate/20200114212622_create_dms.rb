class CreateDms < ActiveRecord::Migration[5.2]
  def change
    create_table :dms do |t|

      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.integer :user_id
      t.integer :room_id
      t.text :content

      t.timestamps
    end
  end
end
