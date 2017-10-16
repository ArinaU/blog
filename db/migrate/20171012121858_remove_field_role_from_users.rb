class RemoveFieldRoleFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_reference :users, :role, foreign_key: true
  end
end
