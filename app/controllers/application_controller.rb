# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protected

  def after_sign_in_path_for(_resource)
    dashboard_path
  end

  def after_sign_up_path_for(resource)
    after_sign_in_path_for(resource)
  end
end
