# frozen_string_literal: true

class CreateRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :roles do |t|
      t.string :role_name

      t.timestamps
    end
  end
end
