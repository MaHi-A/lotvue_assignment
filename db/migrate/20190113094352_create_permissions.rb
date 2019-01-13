# frozen_string_literal: true

class CreatePermissions < ActiveRecord::Migration[5.2]
  def change
    create_table :permissions do |t|
      t.string :resource
      t.text :access_type
      t.references :user, foreign_key: true

      t.timestamps
    end

    # Remove role from users model
    remove_column :users, :role
  end
end
