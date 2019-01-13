# frozen_string_literal: true

module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |_exception|
      redirect '/404'
    end
  end
end
