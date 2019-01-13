# frozen_string_literal: true

class User < ApplicationRecord
  ROLES = ['No Access', 'View Access', 'Add Access']
  enum role: ROLES

  # Associations
  has_many :posts, dependent: :destroy

  # Validations
  validates :name, :email, :role, presence: true
  validates :email, uniqueness: true,
                    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end
