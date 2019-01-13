# frozen_string_literal: true

class RenameAccessTypeToAuthorizedFor < ActiveRecord::Migration[5.2]
  def change
    rename_column :permissions, :access_type, :authorized_for
  end
end
