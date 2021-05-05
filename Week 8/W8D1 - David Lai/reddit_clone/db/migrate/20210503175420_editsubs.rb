class Editsubs < ActiveRecord::Migration[5.2]
  def change
    remove_column :subs, :author_id
    add_column :subs, :moderator_id, :integer, index: true, null: false
  end
end
