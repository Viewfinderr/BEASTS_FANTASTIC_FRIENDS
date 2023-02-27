class ChangeBeastTagsColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :beasts, :tags
    add_column :beasts, :tags, :string, array: true, default: []
  end
end
