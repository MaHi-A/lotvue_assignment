# frozen_string_literal: true

module Users
  class Create
    attr_reader :params, :controller

    def initializer(_controller, params)
      @params = params
      call
    end

    def call
      rebuild_the_permissions_attributes
      password = Rails.application.credentials.users[:default_password]
      params.merge(password: password, confirm_password: password)
      user = User.build(params)
      user.save
    end

    def rebuild_the_permissions_attributes
      generate_default_permissions if params[:permisssions_attributes].blank?
      params[:permisssions_attributes] = params[:permisssions_attributes].map do |permission|
        permission.select { Permission::ACCESS_LEVELS.include?(key) }
      end
    end

    def set_default_permissions
      params[:permisssions_attributes] = [{ 'no_access' => 'true', 'read' => 'false', 'write' => 'false', 'all' => 'false' }]
    end
  end
end
