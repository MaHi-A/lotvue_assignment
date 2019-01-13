# frozen_string_literal: true

class Permission < ApplicationRecord
  ACCESS_LEVELS = %w[no read write all].freeze
end
