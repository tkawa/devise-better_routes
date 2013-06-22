require 'devise'
require 'action_dispatch'
require 'active_support'
require 'devise/better_routes/version'

module Devise
  module Controllers
    module UrlHelpers
      def self.override_registration_helpers!(registration_routes = nil)
        helper_mappings = {
          registration: '#{scope.to_s.pluralize}',
          new_registration: 'new_#{scope}',
          edit_registration: 'edit_current_#{scope}',
          cancel_registration: 'cancel_current_#{scope}'
        }
        [:path, :url].each do |path_or_url|
          helper_mappings.each do |old_name, new_name|
            method = "#{old_name}_#{path_or_url}"
            class_eval <<-URL_HELPERS, __FILE__, __LINE__ + 1
              def #{method}(resource_or_scope, *args)
                scope = Devise::Mapping.find_scope!(resource_or_scope)
                send("#{new_name}_#{path_or_url}", *args)
              end
            URL_HELPERS
          end
        end
      end
      override_registration_helpers!(Devise::URL_HELPERS[:registration])

      def self.run_generate_hooks!
        self.override_registration_helpers!(Devise::URL_HELPERS[:registration])
      end
    end
  end

  def self.regenerate_helpers!
    Devise::Controllers::UrlHelpers.remove_helpers!
    Devise::Controllers::UrlHelpers.generate_helpers!
    Devise::Controllers::UrlHelpers.run_generate_hooks!
  end
end

module ActionDispatch
  module Routing
    class Mapper
      protected
        def devise_registration(mapping, controllers)
          path, as, @scope[:path], @scope[:as] = @scope[:path], @scope[:as], nil, nil
          current_resource_name = mapping.path_names["current_#{mapping.singular}".to_sym]
          resources mapping.path, only: [:create, :new]
          resource current_resource_name, only: [:edit, :update, :destroy] do
            get :cancel
          end
        ensure
          @scope[:path], @scope[:as] = path, as
        end
    end
  end
end

ActiveSupport::Inflector.inflections do |inflect|
  inflect.uncountable %w( my me )
end
