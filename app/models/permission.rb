# frozen_string_literal: true

class Permission < ApplicationRecord
  belongs_to :user
  ACCESS_LEVELS = %w[no_access read write all].freeze

  serialize :access_type
end
