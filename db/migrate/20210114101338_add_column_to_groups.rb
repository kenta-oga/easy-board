class AddColumnToGroups < ActiveRecord::Migration[6.0]
  def change
    add_index :groups, :name,     unique: true
    add_index :groups, :passcode, unique: true
  end
end
