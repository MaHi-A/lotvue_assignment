# frozen_string_literal: true

class DashboardController < ApplicationController
  before_action :create_new_user, only: [:show]
  def show; end

  private

  def create_new_user
    @user = User.new
  end
end
