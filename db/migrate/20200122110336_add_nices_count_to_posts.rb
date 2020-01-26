class AddNicesCountToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :nices_count, :integer, null: false, default: 0
  end
end
