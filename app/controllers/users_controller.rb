# frozen_string_literal: true

class UsersController < ApplicationController
  def show; end

  def create
  	if Users::Create.new(self, user_params).call
  		
  	else
  	end
  end

  protected

  def user_params
  	params.require(:user).permit(:name, :email, 
  		permisssions_attributes: [:id, :resource, {authorized_for: []})
  end
end
