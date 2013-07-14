require 'devise'
require 'action_dispatch'
require 'active_support'
require 'devise/better_routes/version'

module Devise
  module Controllers
    module UrlHelpers
      def self.override_current_resource_helpers!(routes = {})
        routes.each do |module_name, actions|
          [:path, :url].each do |path_or_url|
            actions.each do |action|
              action = action ? "#{action}_" : ""
              method = "#{action}#{module_name}_#{path_or_url}"

              class_eval <<-URL_HELPERS, __FILE__, __LINE__ + 1
                def #{method}(resource_or_scope, *args)
                  scope = Devise::Mapping.find_scope!(resource_or_scope)
                  current_resource_name = _devise_path_name(scope, "current_\#{scope}")
                  _devise_route_context.send("#{action}\#{current_resource_name}_#{module_name}_#{path_or_url}", *args)
                end
              URL_HELPERS
            end
          end
        end
      end

      def self.override_registration_helpers!(registration_routes = nil)
        helper_mappings = {
          new_registration: 'new_#{scope}',
          edit_registration: 'edit_#{current_resource_name}',
          cancel_registration: 'cancel_#{current_resource_name}'
        }
        [:path, :url].each do |path_or_url|
          # TODO: use real helper name
          class_eval <<-URL_HELPERS, __FILE__, __LINE__ + 1
            def registration_#{path_or_url}(resource_or_scope, *args)
              scope = Devise::Mapping.find_scope!(resource_or_scope)
              current_resource_name = _devise_path_name(scope, "current_\#{scope}")
              if respond_to?(:controller_name) && controller_name == _devise_registration_controller(scope, current_resource_name)
                _devise_route_context.send("\#{current_resource_name}_#{path_or_url}", *args)
              else
                _devise_route_context.send("\#{scope.to_s.pluralize}_#{path_or_url}", *args)
              end
            end
          URL_HELPERS
          helper_mappings.each do |old_name, new_name|
            method = "#{old_name}_#{path_or_url}"
            class_eval <<-URL_HELPERS, __FILE__, __LINE__ + 1
              def #{method}(resource_or_scope, *args)
                scope = Devise::Mapping.find_scope!(resource_or_scope)
                current_resource_name = _devise_path_name(scope, "current_\#{scope}")
                _devise_route_context.send("#{new_name}_#{path_or_url}", *args)
              end
            URL_HELPERS
          end
        end
      end

      def self.run_generate_hooks!
        self.override_current_resource_helpers!(Devise::URL_HELPERS.slice(:session, :password))
        self.override_registration_helpers!(Devise::URL_HELPERS[:registration])
      end
      run_generate_hooks!

      def _devise_path_name(scope, name)
        Devise.mappings[scope].path_names[name.to_sym]
      end
      def _devise_registration_controller(scope, name)
        controllers = Devise.mappings[scope].controllers
        if controllers.include?(name.to_sym)
          controllers[name.to_sym]
        elsif controllers.include?(:registrations)
          controllers[:registrations]
        else
          name.pluralize
        end
      end
      private :_devise_path_name, :_devise_registration_controller
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
        def devise_session(mapping, controllers)
          current_resource_name = mapping.path_names["current_#{mapping.singular}".to_sym]
          path, as, @scope[:path], @scope[:as] = @scope[:path], @scope[:as], nil, nil
          resource current_resource_name, only: [] do
            resource :session, only: [:create, :destroy], controller: controllers[:sessions]
            resource :session, only: [], controller: controllers[:sessions], path: '' do
              get :new, path: mapping.path_names[:'session/new'], as: 'new'
            end
          end
        ensure
          @scope[:path], @scope[:as] = path, as
        end

        def devise_password(mapping, controllers)
          current_resource_name = mapping.path_names["current_#{mapping.singular}".to_sym]
          path, as, @scope[:path], @scope[:as] = @scope[:path], @scope[:as], nil, nil
          resource current_resource_name, only: [] do
            resource :password, :only => [:new, :create, :edit, :update],
              :path => mapping.path_names[:password], :controller => controllers[:passwords]
          end
        ensure
          @scope[:path], @scope[:as] = path, as
        end

        def devise_registration(mapping, controllers)
          path, as, @scope[:path], @scope[:as] = @scope[:path], @scope[:as], nil, nil
          current_resource_name = mapping.path_names["current_#{mapping.name}".to_sym]
          resources_controller_name =
            if controllers.include?(mapping.path.to_sym)
              controllers[mapping.path.to_sym]
            elsif controllers.include?(:registrations)
              controllers[:registrations]
            else
              nil
            end
          current_resource_controller_name =
            if controllers.include?(current_resource_name.to_sym)
              controllers[current_resource_name.to_sym]
            elsif controllers.include?(:registrations)
              controllers[:registrations]
            else
              nil
            end
          resources mapping.path, only: [:create, :new], controller: resources_controller_name
          resource current_resource_name, only: [:edit, :update, :destroy], controller: current_resource_controller_name do
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
