class CreateDms < ActiveRecord::Migration[5.2]
  def change
    create_table :dms do |t|

      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.references :user, foreign_key: true
      t.references :room, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
