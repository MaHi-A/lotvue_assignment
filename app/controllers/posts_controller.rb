# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :check_authorization

  def show; end

  private

  def check_authorization
	permission = current_user.permissions.find_by(resource: 'Post')
	if permission.present? && permission.access
  end
end
