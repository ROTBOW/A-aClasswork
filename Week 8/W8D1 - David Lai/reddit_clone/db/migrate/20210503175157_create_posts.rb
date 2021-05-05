class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.integer :sub_id, index: true, null: false
      t.integer :author_id, index: true, null: false

      t.timestamps
    end
  end
end
