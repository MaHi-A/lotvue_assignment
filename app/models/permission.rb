# frozen_string_literal: true

class Permission < ApplicationRecord
  belongs_to :user
  ACCESS_LEVELS = %w[no read write all].freeze
end
