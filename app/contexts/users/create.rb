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
      generate_default_permissions unless params[:permisssions_attributes].present? && params[:permisssions_attributes][:authorized_for].present?
      params[:permisssions_attributes] = params[:permisssions_attributes].map do |permission|
        # In future if we want to give permissions based on the model level,
        # we need to send resource type from the front-end Ex: resource: 'Post'
        permission.select { Permission::ACCESS_LEVELS.include?(key) }.merge(resource: 'all')
      end
    end

    def set_default_permissions
      params[:permisssions_attributes] = [
        {
          resource: 'all',
          authorized_for: {
            'no_access' => 'true', 'read' => 'false',
            'write' => 'false', 'all' => 'false'
          }
        }
      ]
    end
  end
end
