class AddColumnToGroups < ActiveRecord::Migration[6.0]
  def change
    add_index :groups, :email,    unique: true
    add_index :groups, :passcode, unique: true
  end
end
